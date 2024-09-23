<taglib prefix="form" uri="http://www.springframework.org/tags/form">
<include file="/common/taglib.jsp">

<page contentType="text/html;charset=UTF-8" language="java">
<html>
<head>
    <title>Danh Sách Tòa Nhà</title>
</head>
<body>
    <div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>

                <li>
                    <a href="#">UI &amp; Elements</a>
                </li>
                <li class="active">Content Sliders</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1> Danh sách tòa nhà
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box" style="font-family: Verdana, Geneva, Tahoma, sans-serif">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>

                            <span class="widget-toolbar">
											<a href="#" data-action="reload">
												<i class="ace-icon fa fa-refresh"></i>
											</a>
											<a href="#" data-action="collapse">
												<i class="ace-icon fa fa-chevron-up"></i>
											</a>
										</span>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form action="/admin/building-list" method="GET" id="ListForm" modelAttribute="modelSearch">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label >Tên tòa nhà</label>
<%--                                                    <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                    <form:input path="name" class="form-control"/>
                                                </div>
                                                <div class="col-xs-6">
                                                    <label>Diện tích sàn</label>
<%--                                                    <input type="number" class="form-control" name="floorarea" value="${modelSearch.floorArea}">--%>
                                                    <form:input path="floorArea" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <label>Quận</label>
<%--                                                    <select name="district" id="" class="form-control">--%>
<%--                                                        <option value="">Chọn Quận</option>--%>
<%--                                                        <option value="Quan_1">Quận 1</option>--%>
<%--                                                        <option value="Quan_2">Quận 2</option>--%>
<%--                                                    </select>--%>
                                                    <form:select path="district" class="form-control">
                                                        <form:option value="" label="---Chọn Quận---"></form:option>
                                                        <form:options items="${districtCode}"/>
                                                    </form:select>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label>Phường</label>
<%--                                                    <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                    <form:input path="ward" class="form-control"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label >Đường</label>
<%--                                                    <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                    <form:input path="street" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label >Số tầng hầm</label>
<%--                                                    <input type="number" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">--%>
                                                    <form:input path="numberOfBasement" class="form-control"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label>Hướng</label>
<%--                                                    <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">--%>
                                                    <form:input path="direction" class="form-control"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label >Hạng tòa nhà</label>
<%--                                                    <input type="text" class="form-control" name="level" value="${modelSearch.level}">--%>
                                                    <form:input path="level" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <label>Diện tích từ</label>
<%--                                                    <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">--%>
                                                    <form:input path="areaFrom" class="form-control"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label>Diện tích đến</label>
<%--                                                    <input type="number" class="form-control" name="areaTo" value="${modelSearch.areaTo}">--%>
                                                    <form:input path="areaTo" class="form-control"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label>Giá thuê từ</label>
<%--                                                    <input type="number" class="form-control" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">--%>
                                                    <form:input path="rentPriceFrom" class="form-control"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label >Giá thuê đến</label>
<%--                                                    <input type="number" class="form-control" name="rentPriceTo" value="${modelSearch.rentPriceTo}">--%>
                                                    <form:input path="rentPriceTo" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-5">
                                                    <label>Tên quản lý</label>
<%--                                                    <input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}">--%>
                                                    <form:input path="managerName" class="form-control"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label>Số điện thoại quản lý</label>
<%--                                                    <input type="text" class="form-control" name="managerPhone" value="${modelSearch.managerPhone}">--%>
                                                    <form:input path="managerPhone" class="form-control"/>
                                                </div>
                                                <div class="col-xs-2">
                                                    <label>Nhân Viên</label>
                                                    <form:select path="staffId" class="form-control">
                                                        <form:option value="" label="---Chọn nhân viên---"></form:option>
                                                        <form:options items="${staffs}"/>
                                                    </form:select>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
<%--                                                <div class="col-xs-6">--%>
<%--                                                    <label><input type="checkbox" name="typeCode">Nội Thất</label>--%>
<%--                                                    <label><input type="checkbox" name="typeCode">Nguyên Căn</label>--%>
<%--                                                    <label><input type="checkbox" name="typeCode">Tầng trệt</label>--%>
<%--                                                </div>--%>
                                                <form:checkboxes path="typeCode" items="${typeCode}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <button class="btn btn-sm btn-primary" id="btnSearch"><i class="ace-icon glyphicon glyphicon-search"></i>Tìm kiếm</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
                    <div class="pull-right">
                        <a href="/admin/building-edit">
                            <button title="Thêm tòa nhà" class="btn btn-primary" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                            </button>
                        </a>

                        <button title="Xóa tòa nhà" class="btn btn-danger" id="btnDeleteBuildings"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                            <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                        </svg>
                        </button>
                    </div>
                </div>

            </div><!-- /.row -->
            <div class="hr hr-18 dotted hr-double"></div>
            <div class="row">
                <div class="col-xs-12">
                    <table class="table table-striped table-bordered table-hover" style="font-family: Verdana, Geneva, Tahoma, sans-serif" id="buildingList">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên tòa nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Tên quản lý</th>
                            <th>Phone quản lý</th>
                            <th>Diện tích sàn</th>
                            <th>Diện tích trống</th>
                            <th>Diện tích thuê</th>
                            <th>Giá thuê</th>
                            <th>Phí dịch vụ</th>
                            <th>Phí môi giới</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="it" items="${buildingList}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" value="${it.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>${it.name}</td>
                                <td>${it.address}</td>
                                <td>${it.numberOfBasement}</td>
                                <td>${it.managerName}</td>
                                <td>${it.managerPhone}</td>
                                <td>${it.floorArea}</td>
                                <td>${it.emptyArea}</td>
                                <td>${it.rentArea}</td>
                                <td>${it.rentPrice}</td>
                                <td>${it.serviceFee}</td>
                                <td>${it.brokerageFee}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" onclick="assignBuilding(${it.id})">
                                            <i class="ace-icon fa fa-check bigger-120" title="Giao tòa nhà"></i>
                                        </button>

                                        <a class="btn btn-xs btn-info" title="sửa tòa nhà" href="/admin/building-edit-${it.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>

                                        <button class="btn btn-xs btn-danger" onclick="btnDeleteBuilding(${it.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
    <div class="modal fade" id="assignBuildingModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
<%--                <h4 class="modal-title">Danh sách nhân viên</h4>--%>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered" style="font-family: Verdana, Geneva, Tahoma, sans-serif" id="staffList">
                    <thead>
                    <tr>
                        <th class="center">
                            Chọn
                        </th>
                        <th class="center">Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button title="Giao tòa nhà" class="btn btn-primary" id="btnAssignBuilding"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                    <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5zm1.294 7.456A2 2 0 0 1 4.732 11h5.536a2 2 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456M12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                </svg>
                </button>
<%--                <button title="Hủy bỏ" class="btn btn-danger" data-dismiss="modal"><i class="ace-icon fa fa-trash-o bigger-200"></i>--%>
<%--                </button>--%>
            </div>
        </div>
    </div>
</div>
    <script>
        function assignBuilding(buildingId){
            $('#assignBuildingModal').modal();
            $('#buildingId').val(buildingId);
            loadStaffs(buildingId);
        }
        function loadStaffs(buildingId){
            $.ajax({
                type: "GET",
                url: "/api/buildings/" + buildingId + "/staffs",
                dataType: "json",
                success:(respond)=>{
                    var row = '';
                    $.each(respond.data, function (index, it){
                       row += '<tr>';
                       row += '<td class="center"><input type="checkbox" value=' + it.staffId + ' id="checkbox_' + it.staffId + '" ' + it.checked + '/></td>';
                       row += '<td class="text-center">' + it.fullName + '</td>';
                       row += '</tr>';
                    });
                    $('#staffList tbody').html(row);
                },
                error:(respond)=>{
                    console.log(respond);
                }
            });
        }
        $('#btnAssignBuilding').click(function(e){
            e.preventDefault();
            var data = {};
            data['buildingId'] = $('#buildingId').val();
            var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data['staffs'] = staffs;

            $.ajax({
                url: "/api/buildings",
                type: "PUT",
                dataType: "text",
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function(){
                    window.location.replace("/admin/building-list")
                    alert("Giao thành cong!");
                },
                error: function(){
                    console.log("Fail success!");
                }
            });
        });

        $('#btnDeleteBuildings').click(function(e){
            e.preventDefault();
            var data = {};
            var buildingIds = $('#buildingList').find('tbody input[type=checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data['buildingIds'] = buildingIds;
            deleteBuilding(data);
        });
        // xóa một
        function btnDeleteBuilding(buildingId){
            var data = {};
            data['buildingIds'] = buildingId;
            deleteBuilding(data);
        }
        function deleteBuilding(data){
            $.ajax({
                type: "DELETE",
                url: "/api/buildings/" + data['buildingIds'],
                dataType: "text",
                data: JSON.stringify(data),
                contentType: "application/json",
                success:(respond)=>{
                    alert(respond)
                    window.location.replace("/admin/building-list")
                },
                error:(respond)=>{
                    alert("Xóa thất bại!")
                    console.log(respond);
                }
            });
        }
        $('#btnSearch').click(function (e){
            e.preventDefault();
            $('#ListForm').submit();
        })
    </script>
</body>
</html>
