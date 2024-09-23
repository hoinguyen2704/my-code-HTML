package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public void createJoinQuery(BuildingSearchRequest request, StringBuilder sql) {
        Long AreaFrom = request.getAreaFrom();
        Long AreaTo = request.getAreaTo();
        if (AreaFrom != null || AreaTo != null) {
            sql.append(" INNER JOIN rentarea r ON b.id = r.buildingid ");
        }

        Long staffID = request.getStaffId();
        if (staffID != null) {
            sql.append(" INNER JOIN assignmentbuilding asm on b.id = asm.buildingid ");
        }
    }
    private void createWhereQueryNormal(BuildingSearchRequest request, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if (!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area")
                        && !fieldName.startsWith("rentPrice")) {
                    Object value = item.get(request);
                    if (value != null && value != "") {
                        if (item.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND b." + fieldName + " = " + value + " ");
                        } else if (item.getType().getName().equals("java.lang.Long")) {
                            where.append(" AND b." + fieldName + " = " + value + " ");
                        } else if (item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b." + fieldName + " like '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void createWhereQuerySpecial(BuildingSearchRequest request, StringBuilder where) {
        Long AreaFrom = request.getAreaFrom();
        Long AreaTo = request.getAreaTo();
        if (AreaTo != null) {
            where.append(" AND r.value <= " + AreaTo);
        }
        if (AreaTo != null) {
            where.append(" AND r.value >= " + AreaFrom);
        }

        Long rentPriceFrom = request.getRentPriceFrom();
        Long rentPriceTo = request.getRentPriceTo();
        if (rentPriceTo != null) {
            where.append(" AND b.rentprice <= " + rentPriceTo);
        }
        if (rentPriceFrom != null) {
            where.append(" AND b.rentprice >= " + rentPriceFrom);
        }

        Long staffID = request.getStaffId();
        if (staffID != null) {
            where.append(" AND asm.staffid = " + staffID);
        }

        List<String> typeCode = request.getTypeCode();
        if (typeCode != null && !typeCode.isEmpty()) {
            where.append(" AND ");
            String sqlJoin = typeCode.stream().map(item -> " b.type like '%" + item + "%'").collect(Collectors.joining(" or "));
            where.append(sqlJoin + " ");
        }
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest request) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        createJoinQuery(request, sql);
        createWhereQueryNormal(request, where);
        createWhereQuerySpecial(request, where);
        sql.append(where);
        sql.append(" GROUP BY b.id ");
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }
}
