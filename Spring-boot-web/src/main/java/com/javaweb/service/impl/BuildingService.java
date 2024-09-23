package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.*;

@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private BuildingService buildingService;

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest request) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(request);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for (BuildingEntity item : buildingEntities) {
            BuildingSearchResponse building = buildingConverter.toBuildingSearchResponse(item);
            result.add(building);
        }
        return result;
    }

    @Override
    @Transactional
    public void createOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.fromDTOtoEntityWithoutRentArea(buildingDTO);
        buildingRepository.save(buildingEntity);
        String[] convertString = buildingDTO.getRentArea().split(",");
        if(convertString.length > 0) {
            rentAreaRepository.deleteAllByBuildingRentArea_Id(buildingEntity.getId());
            for(String str : convertString){
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Long.parseLong(str.trim()));
                rentAreaEntity.setBuildingRentArea(buildingEntity);
                rentAreaRepository.save(rentAreaEntity);
            }
        }
    }

    @Override
    public BuildingEntity findById(Long id) {
        Optional<BuildingEntity> buildingEntity = buildingRepository.findById(id);
        if (buildingEntity.isPresent()) {
            return buildingEntity.get();
        } else {
            throw new EntityNotFoundException("Không tim thấy ID tòa nhà: " + id);
        }
    }

    @Override
    @Transactional
    public void deleteBuilding(List<Long> ids) {
        rentAreaRepository.deleteByBuildingRentArea_IdIn(ids);
        assignmentBuildingRepository.deleteByBuildingAssign_IdIn(ids);
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public ResponseDTO getStaff(Long id) {
        Map<Long, String> listStaffs = userService.getStaffs();
        BuildingEntity buildingEntity = buildingService.findById(id);
        Map<Long, String> listStaffAssigned = userService.getStaffsAssigned(buildingEntity);
        List<StaffResponseDTO> staffAssignment = userService.getStaffResponseDTOS(listStaffs, listStaffAssigned);
        ResponseDTO result = new ResponseDTO();
        result.setData(staffAssignment);
        result.setMessage("Success");
        return result;
    }


}
