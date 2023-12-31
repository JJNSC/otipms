/**
 * app-ecommerce-product-list
 */

'use strict';

// Datatable (jquery)
document.addEventListener("DOMContentLoaded", function () {
 

  // Variable declaration for table
  var empNo = null;
  
  var dt_product_table = $('.datatables-products'),
    productAdd = "noticeAdd"
  
  //DataTable
  if (dt_product_table.length) {
    var dt_products = dt_product_table.DataTable({
       ajax: {
            url: 'employeeListJson',
            type : "GET",
            dataSrc: ''
        }, // JSON file to add data
      columns: [
        // columns according to JSON
          { data: "empStatus" },
          { data: "empId" },
          { data: 'empName' },
          { data: 'empRank' },
          { data: 'empTel' },
          { data: 'projectName' },
          { data: 'teamName' },
          { data: 'empId' }
      ],
      columnDefs: [
		  {
		      //notice title
		  targets: 0,
		  responsivePriority: 1,
		  orderable: false,
		  render: function (data, type, full, meta) {
		 	 var $empStatus = full['empStatus']; //writer 필드에서 글쓴이 이름을 가져옴
		 	 if($empStatus==1){
		 		 return "<span class='text-truncate d-flex align-items-center taskEvent-green'></span>";
		 	 }else{
		 		 return "<span class='text-truncate d-flex align-items-center taskEvent-gray'></span>";
		 	 }
		  }
		},
        {
          // For Responsive
          className: 'control',
          searchable: false,
          orderable: true,
          responsivePriority: 2,
          targets: 1,
          render: function (data, type, full, meta) {
        	  empNo = full['empId'];
            return "<span class='text-truncate d-flex align-items-center'>" + empNo + '</span>';
          }
        },
        
        {
           //notice no
           targets: 2,
           render: function (data, type, full, meta) {
        	   var $empName = full['empName'];

               // Create a text output for Product name
               var $row_output =
                 '<div class="d-flex justify-content-start align-items-center product-name" >' +
                 '<div class="d-flex flex-column">' +
                 '<h6 class="text-body text-nowrap mb-0">' +
                 $empName + 
                 '</h6>' +
                 '</div>' +
                 '</div>';
               return $row_output;
           }
        },
        {
             //notice title
             targets: 3,
             responsivePriority: 1,
             render: function (data, type, full, meta) {
            	 var $empRank = full['empRank']; //writer 필드에서 글쓴이 이름을 가져옴
                 return "<span class='text-truncate d-flex align-items-center'>" + $empRank + '</span>';
             }
           },
        {
          // writer

          targets: 4,
          responsivePriority: 5,
          render: function (data, type, full, meta) {
        	  var $empTel = full['empTel']; //date 필드에서 날짜 정보를 가져옴
              return '<span class="text-truncate d-flex align-items-center">' + $empTel + '</span>';
          }
        },
        {
           //date
           targets: 5,
           render: function (data, type, full, meta) {
        	   var $projectName = full['projectName']; //date 필드에서 날짜 정보를 가져옴
       		return '<span class="text-truncate d-flex align-items-center">' + $projectName + '</span>';
           }
        },
        {
        	//date
        	targets: 6,
        	render: function (data, type, full, meta) {
        		var $teamName = full['teamName']; //date 필드에서 날짜 정보를 가져옴
        		return '<span class="text-truncate d-flex align-items-center">' + $teamName + '</span>';
        	}
        },
        {
        	//date
        	targets: 7,
        	searchable: false,
            orderable: false,
        	render: function (data, type, full, meta) {
        		var $employeeId = full['empId']; //date 필드에서 날짜 정보를 가져옴
        		return '<span class="text-truncate d-flex align-items-center" ' +
        	    'onclick="openMailWindow(' + $employeeId + ')">' +
        	    '<i class="icon-copy ion-paper-airplane"></i>' +
        	    '</span>';
        	}
        }
      ],
      order: [2, 'asc'], //set any columns order asc/desc
      dom:
        '<"card-header d-flex border-top rounded-0 flex-wrap py-md-0"' +
        '<"me-5 ms-n2 pe-5"f>' +
        '<"d-flex justify-content-start justify-content-md-end align-items-baseline"<"dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0"lB>>' +
        '>t' +
        '<"row mx-2"' +
        '<"col-sm-12 col-md-6"i>' +
        '<"col-sm-12 col-md-6"p>' +
        '>',
      lengthMenu: [10, 20, 50, 70, 100], //for length of menu
      language: {
        sLengthMenu: '_MENU_',
        search: '',
        searchPlaceholder: '검색',
        info: 'Displaying _START_ to _END_ of _TOTAL_ entries'
      },
      // Buttons with Dropdown
      buttons: [
        {
          text: '<i class="bx bx-plus me-0 me-sm-1"></i><span class="d-none d-sm-inline-block">공지사항 등록</span>',
          className: 'add-new btn btn-primary',
          action: function () {
            window.location.href = productAdd;
          }
        }
      ],
      // For responsive popup
      /*responsive: {
        details: {
          display: $.fn.dataTable.Responsive.display.modal({
            header: function (row) {
              var data = row.data();
              return 'Details of ' + data['product_name'];
            }
          }),
          type: 'column',
          renderer: function (api, rowIdx, columns) {
            var data = $.map(columns, function (col, i) {
              return col.title !== '' // ? Do not show row in modal popup if title is blank (for check box)
                ? '<tr data-dt-row="' +
                    col.rowIndex +
                    '" data-dt-column="' +
                    col.columnIndex +
                    '">' +
                    '<td>' +
                    col.title +
                    ':' +
                    '</td> ' +
                    '<td>' +
                    col.data +
                    '</td>' +
                    '</tr>'
                : '';
            }).join('');

            return data ? $('<table class="table"/><tbody />').append(data) : false;
          }
        }
      },*/
      initComplete: function () {
        // Adding status filter once table initialized
        this.api()
          .columns(-2)
          .every(function () {
            var column = this;
            var select = $(
              '<select id="ProductStatus" class="form-select text-capitalize"><option value="">Status</option></select>'
            )
              .appendTo('.product_names')
              .on('change', function () {
                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                column.search(val ? '^' + val + '$' : '', true, false).draw();
              });

            column
              .data()
              .unique()
              .sort();
          });
        // Adding category filter once table initialized
        this.api()
          .columns(3)
          .every(function () {
            var column = this;
            var select =
            column
              .data()
              .unique()
              .sort();
          });
        // Adding stock filter once table initialized
        this.api()
          .columns(4)
      }
    });
    $('.dataTables_length').addClass('mt-0 mt-md-3 me-3');
    // To remove default btn-secondary in export buttons
    $('.dt-buttons > .btn-group > button').removeClass('btn-secondary');
  }

  // Delete Record
  $('.datatables-products tbody').on('click', '.delete-record', function () {
    dt_products.row($(this).parents('tr')).remove().draw();
  });

  // Filter form control to default size
  // ? setTimeout used for multilingual table initialization
  setTimeout(() => {
    $('.dataTables_filter .form-control').removeClass('form-control-sm');
    $('.dataTables_length .form-select').removeClass('form-select-sm');
  }, 300);
  
  //해당 select 요소에 대한 jQuery 선택자
  var projectDropdown = $('#project-dropdown');
  var teamDropdown = $('#team-dropdown');

  // select 요소의 값이 변경될 때 이벤트 리스너 추가
  projectDropdown.on('change', function() {
  var selectedProject = projectDropdown.val();
  var selectedTeam = teamDropdown.val();

  // DataTables의 ajax 요청을 다시 호출
  dt_products.ajax.url('employeeListJson?project=' + selectedProject + '&team=' + selectedTeam).load();
  });

  teamDropdown.on('change', function() {
  var selectedProject = projectDropdown.val();
  var selectedTeam = teamDropdown.val();

  // DataTables의 ajax 요청을 다시 호출
  dt_products.ajax.url('employeeListJson?project=' + selectedProject + '&team=' + selectedTeam).load();
  });
});

function openMailWindow(employeeId) {
    var url = contextPath + '/mail/writeMail?empId=' + employeeId;
    var options = 'width=920, height=680, left=800, top=30';
    window.open(url, '_blank', options);
}




