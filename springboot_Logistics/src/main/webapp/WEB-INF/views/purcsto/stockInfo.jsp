<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>purchase</title>
<script
	src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.noStyle.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/ag-grid-community/dist/styles/ag-grid.css">
<link rel="stylesheet"
	href="https://unpkg.com/ag-grid-community/dist/styles/ag-theme-balham.css">
<script
	src="${pageContext.request.contextPath}/js/modal.js?v=<%=System.currentTimeMillis()%>"
	defer></script>
<script src="${pageContext.request.contextPath}/js/datepicker.js" defer></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/datepicker.css">

<script>
      // O setting datapicker
      $(function() {
        // set default dates
        let start = new Date();
        start.setDate(start.getDate() - 20);
        // set end date to max one year period:
        let end = new Date(new Date().setYear(start.getFullYear() + 1));
        // o set searchDate
        $('[data-toggle="datepicker"]').datepicker({
          autoHide: true,
          zIndex: 2048,
        });
        $('#datepicker').datepicker({
          todayHiglght: true,
          autoHide: true,
          autoaShow: true,
        });
        // o set searchRangeDate
        $('#fromDate').datepicker({
          startDate: start,
          endDate: end,
          minDate: "-10d",
          todayHiglght: true,
          autoHide: true,
          autoaShow: true,
          // update "toDate" defaults whenever "fromDate" changes
        })
        $('#toDate').datepicker({
          startDate: start,
          endDate: end,
          todayHiglght: true,
          autoHide: true,
          autoaShow: true,
        })
        $('#fromDate').on("change", function() {
          //when chosen from_date, the end date can be from that point forward
          var startVal = $('#fromDate').val();
          $('#toDate').data('datepicker').setStartDate(startVal);
        });
        $('#toDate').on("change", function() {
          //when chosen end_date, start can go just up until that point
          var endVal = $('#toDate').val();
          $('#fromDate').data('datepicker').setEndDate(endVal);
        });

      });
    </script>
<style>
.fromToDate {
	margin-bottom: 7px;
}

button {
	background-color: #0B7903;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	border-radius: 3px;
	margin-bottom: 10px;
}

.ag-header-cell-label {
	justify-content: center;
}

.ag-cell-value {
	padding-left: 25px;
}

.form-control {
	display: inline;
	!
	important;
}

#orderModal {
	position: absolute !important;
	z-index: 3000;
}

.btnContainer {
	display: flex;
	flex-direction: row;
}

.checkBtn {
	margin-right: 10px;
}

@media ( min-width : 768px) {
	.modal-xl {
		width: 90%;
		max-width: 1200px;
	}
}
</style>
</head>
<body>
	<article class="warehousing">
		<div class="warehousing__Title" style="color: black">
			<h5>🏟️ 재고</h5>
			<b>입고</b><br />
			<form autocomplete="off" style="display: inline-block">
				<input type="text" data-toggle="datepicker" id="warehousingDate"
					placeholder="입고 일자 📅" size="15" autocomplete="off"
					style="text-align: center">&nbsp;&nbsp;
			</form>
			<button id="warehousingModalButton">입고</button>
			<button id="extraImportButton">번외 입고</button>
		</div>
	</article>
	<article class="myGrid">
		<div align="center">
			<div id="myGrid" class="ag-theme-balham"
				style="height: 70vh; width: auto; text-align: center;"></div>
		</div>
	</article>
	<%--O WAREHOUSING MODAL--%>
	<div class="modal fade" id="warehousingModal" role="dialog">
		<div class="modal-dialog modal-xl">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						<h5>MRP SIMULATION</h5>
						<div class="btnContainer">
							<button id="checkingButton" class="checkBtn">발주품목 검사</button>
							<button id="warehousingButton">발주품목 입고</button>
						</div>
					</div>
					<button type="button" class="close" data-dismiss="modal"
						style="padding-top: 0.5px">&times;</button>
				</div>
				<div class="modal-body">
					<div id="warehousingGrid" class="ag-theme-balham"
						style="height: 40vh; width: auto;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- INSERT MODAL-->

	<div class="modal fade" id="extraInsertModal" role="dialog">
		<div class="modal-dialog modal-xl">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						<h5>번외 입고</h5>
						<div class="btnContainer"></div>
					</div>
					<button type="button" class="close" data-dismiss="modal"
						style="padding-top: 0.5px">&times;</button>
				</div>
				<div class="modal-body">
					<div id="warehousingGrid" class="ag-theme-balham"
						style="height: 50vh; font-size:20px; width: auto;">
		
							
							<!-- select : 한개선택 가능(기본) -->
							입고부품:<select name="camera" id="camera">
								<option value="">::::::  추가  :::::</option>
								<option value='DK-01'>디지털카메라 NO.1</option>
								<option value='DK-02'>디지털카메라 NO.2</option>
								<option value='DK-BC01'>백커버-100</option>
								<option value='DK-FC01'>KC-10P</option>
								<option value='MM-01'>액정모니터 2.5 TFT</option>
								<option value='MC-KP01'>커플러-66</option>
								<option value='LN-01'>렌즈-400</option>
								<option value='JL-01'>조리개-66</option>
								<option value='HA-01'>헤더-22</option>
								<option value='JL-02'>조리개-77</option>
								<option value='HA-02'>헤더-55</option>
								<option value='MM-02'>액정모니터 2.0 TFT</option>
								<option value='DK-BC02'>백커버-200</option>
								<option value='DK-FC02'>KC-20P</option>
								<option value='LN-02'>렌즈-900</option>
								<option value='MC-KP02'>커플러-77</option>
								<option value='DK-AP01'>카메라 본체 NO.1</option>
								<option value='DK-AP02'>카메라 본체 NO.2</option>
							</select></br>  
							<!-- input 타입 텍스트 : 입력받는 칸이 생성됨 , name은 보통 자바스크립트의 함수에서 호출시 많이 사용됨 -->
							<!-- input 타입 텍스트에 value 값이 들어가 있다면 보여지는 칸에 기본적으로 써져있다. -->
							추가할 AMOUNT:<select name="stock" id="stock">
								<option value="">:::::: 추가할곳 :::::</option>
								<option value='STOCK_AMOUNT'>STOCK_AMOUNT</option>
								<option value='ORDER_AMOUNT'>ORDER_AMOUNT</option>
								<option value='INPUT_AMOUNT'>INPUT_AMOUNT</option>
								<option value='DELIVERY_AMOUNT'>DELIVERY_AMOUNT</option>
								<option value='TOTAL_STOCK_AMOUNT'>TOTAL_STOCK_AMOUNT</option>
							</select></br>  
							수량:<input type="text" name="quantity" id="quantity" />    
							
								
							</br><form autocomplete="off" style="display: inline-block">
							<input type="text" data-toggle="datepicker" id="warehousingDate"
								placeholder="입고 일자 📅" size="15" autocomplete="off"
							style="text-align: center">&nbsp;&nbsp;
											
							<br>

					</div>
				</div>
				<div class="modal-footer">
				<button type="button" id=insertStock class="btn btn-default" data-dismiss="modal">저장하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					
				</div>
			</div>
		</div>
	</div>


	<script>
	
	
	
  const myGrid = document.querySelector("#myGrid");
  const warehousingModalBtn = document.querySelector("#warehousingModalButton");
  const extraImportButton = document.querySelector("#extraImportButton");
  const warehousingDate = document.querySelector("#warehousingDate");
  const warehousingBtn = document.querySelector("#warehousingButton");
  const checkingBtn = document.querySelector("#checkingButton");
  const insertStock = document.querySelector("#insertStock");
  const quantity = document.getElementById("quantity").value;
  
  const stockColumn = [
    {headerName: "창고코드", field: "warehouseCode",},
    {headerName: "품목코드", field: "itemCode",},
    {headerName: '품목명', field: "itemName",},
    {headerName: '단위', field: 'unitOfStock',},
    {headerName: '전체재고량', field: 'totalStockAmount',},
    {headerName: '안전재고량', field: 'safetyAllowanceAmount',},
    {headerName: '가용재고량', field: 'stockAmount',},
    {headerName: '입고예정재고량', field: 'orderAmount',},
    {headerName: '투입예정재고량', field: 'inputAmount',},
    {headerName: '납품예정재고량', field: 'deliveryAmount',}
  ];
  let stockRowData = [];
  const stockGridOptions = {
    defaultColDef: {
      flex: 1,
      minWidth: 100,
      resizable: true,
    },
    columnDefs: stockColumn,
    rowSelection: 'multiple',
    rowData: stockRowData,
    getRowNodeId: function(data) {
      return data.itemCode;
    },
    defaultColDef: {editable: false, resizable : true},
    overlayNoRowsTemplate: "조회된 발주 데이터가 없습니다.",
    onGridReady: function(event) {// onload 이벤트와 유사 ready 이후 필요한 이벤트 삽입한다.
      event.api.sizeColumnsToFit();
    },
    onRowSelected: function(event) { // checkbox
      console.log(event);
    },
    onGridSizeChanged: function(event) {
      event.api.sizeColumnsToFit();
    },
    getRowStyle: function(param) {
      return {'text-align': 'center'};
    },
  }
  const showStockGrid = () => {
    let xhr = new XMLHttpRequest();
    xhr.open('POST', '${pageContext.request.contextPath}/stock/searchStockList.do' +
        "?method=searchStockList",
        true)
    xhr.setRequestHeader('Accept', 'application/json');
    xhr.send();
    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4 && xhr.status == 200) {
        let txt = xhr.responseText;
        txt = JSON.parse(txt);
        if (txt.errorCode < 0) {
          swal.fire("오류", txt.errorMsg, "error");
          return;
        }
        console.log(txt);
        stockGridOptions.api.setRowData(txt.gridRowJson);
      }
    }
  }
  // O warehousing modal
  let _setWarehousingModal = (function() {
    let executed = false;
    return function() {
      if (!executed) {
        executed = true;
        setWarehousingModal();
      }
    };
  })();
  
  
  warehousingModalBtn.addEventListener("click", () => {
    if (warehousingDate.value == "") {
      Swal.fire("입력", "입고 날짜를 입력하십시오.", "info");
      return;
    }
    _setWarehousingModal();
    getWarehousingModal();
    $("#warehousingModal").modal('show');
  });
  
  extraImportButton.addEventListener("click", () => {
	  
	    $("#extraInsertModal").modal('show');
	  });
  
 
	insertStock.addEventListener("click", () => {  //modal창 밑에 있는 Save에 걸리는 이벤트
		 Swal.fire({
	           title: '입고하시겠습니까?',
	           icon: 'question',
	           showCancelButton: true,
	           confirmButtonColor: '#3085d6',
	           cancelButtonColor: '#d33',
	           cancelButtonText: '취소',
	           confirmButtonText: '확인',
	         }).then((result)=>{
	            if (result.isConfirmed) {
	                  let xhr = new XMLHttpRequest();
	                  xhr.open('POST', '${pageContext.request.contextPath}/stock/insertStock.do?'
	                      
	                      + "quantity=" + $('#quantity').val()
	                      + "&camera="+$("select[name=camera]").val()
	                      + "&stock="+$("select[name=stock]").val(),
	                      true)
	                  xhr.setRequestHeader('Accept', 'application/json');
	                  xhr.send();
	                  xhr.onreadystatechange = () => {
	                    if (xhr.readyState == 4 && xhr.status == 200) {
	                      let txt = JSON.parse(xhr.responseText);
	                      console.log(txt);
	                      if (txt.errorCode < 0) {
	                        swal.fire("오류", txt.errorMsg, "error");
	                        return;
	                      }
	                      Swal.fire(
	                          '성공!',
	                          '품목 번외입고 완료.',
	                          'success'
	                      )
	                     
	                    }
	                  }
	                }
	         })
	  })
  
  
  // o warehousing modal warehousing
  let orderNoList = [];
  checkingBtn.addEventListener("click",()=>{
     orderNoList = [];
     let checkedItem=false;
     let selectedRows = warehousingGridOptions.api.getSelectedRows();
       if (selectedRows == "") {
         Swal.fire("알림", "선택한 행이 없습니다.", "info");
         return;
       }
       selectedRows.forEach(function(selectedRow, index) {
        if(selectedRow.inspectionStatus=='Y'){
           checkedItem=true;
        }
         orderNoList.push(selectedRow.orderNo);
         console.log(selectedRow);
       });
       if(checkedItem==true){
          orderNoList=[];
          Swal.fire("확인", "검사를 완료한 품목이 있습니다.", "info");
          return;
       }
       
       console.log(selectedRows);
       Swal.fire({
           title: '검사하시겠습니까?',
           html: '발주번호</br>'+ '<b>' + orderNoList + '</b>'+ '</br>검사완료 됩니다.',
           icon: 'warning',
           showCancelButton: true,
           confirmButtonColor: '#3085d6',
           cancelButtonColor: '#d33',
           cancelButtonText: '취소',
           confirmButtonText: '확인',
         }).then((result)=>{
            if (result.isConfirmed) {
                  let xhr = new XMLHttpRequest();
                  xhr.open('POST', '${pageContext.request.contextPath}/purchase/checkOrderInfo.do' +
                      "?method=checkOrderInfo"
                      + "&orderNoList=" + encodeURI(JSON.stringify(orderNoList)),
                      true)
                  xhr.setRequestHeader('Accept', 'application/json');
                  xhr.send();
                  xhr.onreadystatechange = () => {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                      let txt = JSON.parse(xhr.responseText);
                      console.log(txt);
                      if (txt.errorCode < 0) {
                        swal.fire("오류", txt.errorMsg, "error");
                        return;
                      }
                      Swal.fire(
                          '성공!',
                          '발주품목 검사완료.',
                          'success'
                      )
                      warehousingGridOptions.api.updateRowData({ update: selectedRows });
                      _setWarehousingModal();
                      getWarehousingModal();
                      $("#warehousingModal").modal('show');
                    }
                  }
                }
         })
  })
  warehousingBtn.addEventListener('click', () => {
    let selectedRows = warehousingGridOptions.api.getSelectedRows();
    if (selectedRows == "") {
      Swal.fire("알림", "선택한 행이 없습니다.", "info");
      return;
    }
    orderNoList=[];
    selectedRows.forEach(function(selectedRow, index) {
      orderNoList.push(selectedRow.orderNo);
      console.log(selectedRow);
    });
    Swal.fire({
      title: '입고하시겠습니까?',
      html: '발주번호</br>'+ '<b>' + orderNoList + '</b>'+ '</br>입고처리됩니다.',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: '취소',
      confirmButtonText: '저장',
    }).then((result) => {
      if (result.isConfirmed) {
        let xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/stock/warehousing.do?'
            +"orderNoList=" + encodeURI(JSON.stringify(orderNoList)),
            true)
        xhr.setRequestHeader('Accept', 'application/json');
        xhr.send();
        xhr.onreadystatechange = () => {
          if (xhr.readyState == 4 && xhr.status == 200) {
            let txt = JSON.parse(xhr.responseText);
            console.log(txt);
            if (txt.errorCode < 0) {
              swal.fire("오류", txt.errorMsg, "error");
              return;
            }
            Swal.fire(
                '성공!',
                '발주품목이 입고처리 되었습니다.',
                'success'
            )
            selectedRows.forEach(function(selectedRow, index) {
              warehousingGridOptions.api.updateRowData({remove: [selectedRow]});
            });
            console.log(txt);
            showStockGrid();
          }
        }
      }
    })
  });
   
  document.addEventListener('DOMContentLoaded', () => {
    showStockGrid();
    new agGrid.Grid(myGrid, stockGridOptions);
  });
</script>
</body>
</html>