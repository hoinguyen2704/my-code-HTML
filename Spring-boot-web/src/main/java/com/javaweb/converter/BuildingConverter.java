package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity item) {
        BuildingSearchResponse building = modelMapper.map(item, BuildingSearchResponse.class);
        building.setAddress(item.getStreet() + ", " + item.getWard());
        String rentAreas = item.getRentAreaEntities().stream().map(i -> i.getValue().toString()).collect(Collectors.joining(", "));
        building.setRentArea(rentAreas);
        return building;
    }
    public BuildingEntity fromDTOtoEntityWithoutRentArea(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity =  modelMapper.map(buildingDTO, BuildingEntity.class);
        String typeCode = buildingDTO.getTypeCode().stream().collect(Collectors.joining(","));
        buildingEntity.setType(typeCode);
        return buildingEntity;
    }
    public BuildingDTO fromEntityToDTO(BuildingEntity buildingEntity) {
        BuildingDTO building = modelMapper.map(buildingEntity, BuildingDTO.class);
        String rentAreas = buildingEntity.getRentAreaEntities().stream().map(i -> i.getValue().toString()).collect(Collectors.joining(", "));
        building.setRentArea(rentAreas);
        String[] typeCode = buildingEntity.getType().split(",");
        List<String> typeCodes = new ArrayList<>(Arrays.asList(typeCode));
        building.setTypeCode(typeCodes);
        return building;
    }
}
