<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <table id="reserveTable">
        <thead>
            <tr>
                <th data-field="reserveId">訂單編號</th>
                <th data-field="courseId">課程編號</th>
                <th data-field="courseDateTime">課程日期場次</th>
                <th data-field="courseName">課程名稱</th>
                <th data-field="memId">會員編號</th>
                <th data-field="memName">會員名稱</th>
                <th data-field="headcount">人數</th>
                <th data-field="status">訂單狀態</th>
                <th data-field="createTime">訂單創建日期</th>
                <th data-field="totalPrice">總金額</th>
                <th>操作</th>
            </tr>
        </thead>
    </table>

    <script>
        $(document).ready(function () {

            //確認是否有後台瀏覽權限
            function checkAuth() {
                return 1;
            }
            var authCode = checkAuth();
            //若checkAuth為0 = 管理員,則將teaId設-1,可瀏覽全部課程, 1則為後台教師,則將teaId設為該教師
            if (authCode === 0) {
                var teaId = -1;
            } else if (authCode === 1) {
                function getTeaId() {
                    return 1;
                }
                var teaId = getTeaId();
            } else { //若是其他authcode,則無權限瀏覽
                Swal.fire({
                    title: "無權限瀏覽課程預約單!",
                    icon: "warning",
                    confirmButtonText: "返回後台首頁"
                }).then(result => {
                    if (result.isConfirmed) {
                        window.location.href = "index.jsp";
                    }
                });
            }

            function loadReserve(teaId) {
                $.ajax({
                    url: '/diyla_back/getReserve', // 替換成實際的後端 servlet URL
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    type: "post",
                    data: {
                        teaId: teaId
                    },
                    dataType: 'json',
                    success: function (data) {
                        // 使用 jQuery Table 來動態生成表格
                        //(0:預約單建立，1:預約單付款完成，2:預約單取消(未退款)，3.預約單取消(退款完成)，4.預約單完成)
                        $('#reserveTable').DataTable({
                            data: data,
                            searching: true,
                            searchDelay: 500,
                            columns: [
                                { data: 'reserveId' },
                                { data: 'courseId' },
                                { data: 'courseDateSeq' },
                                { data: 'courseName' },
                                { data: 'memId' },
                                { data: 'memName' },
                                { data: 'headcount' },
                                { data: 'status' },
                                { data: 'createTime' },
                                { data: 'totalPrice' }
                            ],
                            columnDefs: [{
                                targets: 10,
                                render: function (data, type, row, meta) {
                                    if (row.status === "預約單建立") {
                                        return '<button class="delete-btn" data-reserveId="' + row.reserveId + '">刪除</button>';
                                    }
                                    else if (row.status === "付款完成") {
                                        return '<button class="delete-refund-btn" data-reserveId="' + row.reserveId + '">刪除/退款</button>';
                                    } else if (row.status === "預約單取消(未退款)")
                                        return '<button class="refund-btn" data-reserveId="' + row.reserveId + '">確認退款</button>';
                                    else {
                                        return '';
                                    }
                                }
                            }
                            ]
                        });
                    },
                    error: function () {
                        alert('Failed to fetch data from server.');
                    }
                });
            }
            loadReserve(teaId);
            function deleteReserve(resId) {
                $.ajax({
                    url: '/diyla_back/modifyReserve',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: { reserveId: resId },
                    success: location.reload()
                });
                // } else if (resId === 1) {
                //     $.ajax({
                //         url: '/diyla_back/refundReserve',
                //         method: 'post',
                //         data: {reserveId: resId},
                //         success: location.reload()
                //     })
                // }
            }
            function refundReserve(resId) {
                $.ajax({
                    url: '/diyla_back/refundReserve',
                    method: 'post',
                    data: { reserveId: resId },
                    success: location.reload()
                })
            }
            $(document).on('click', '.delete-btn', function () {
                let reserveId = $(this).data('reserveid');

                // 使用 SweetAlert 的確認視窗
                Swal.fire({
                    title: '確定要刪除訂單嗎？',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '確定',
                    cancelButtonText: '取消'
                }).then((result) => {
                    if (result.isConfirmed) {
                        deleteReserve(reserveId);
                    }
                });
            });
            $(document).on('click', '.delete-refund-btn', function () {
                let reserveId = $(this).data('reserveid');

                // 使用 SweetAlert 的確認視窗
                Swal.fire({
                    title: '確定要刪除訂單嗎？',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '確定',
                    cancelButtonText: '取消'
                }).then((result) => {
                    if (result.isConfirmed) {
                        let reserveInfo = {
                            reserveId: reserveId
                        }
                        fetch('/diyla_back/refundReserve', {
                            method: 'post',
                            header: {
                                "content-type": "application/json"
                            },
                            body: JSON.stringify(reserveInfo)
                        }).then(function (response) {
                            return response.json();
                        }).then(function (result) {
                            if (result.isSuccessful == 1) {
                                deleteReserve(reserveId);
                                Swal.fire({
                                    icon: "success",
                                    title: "訂單修改成功",
                                    text: "訂單已刪除及退款成功"
                                });
                            } else {
                                Swal.fire({
                                    icon: "warning",
                                    title: "訂單修改失敗",
                                    text: "因無法退款，訂單刪除失敗"
                                });
                            }
                        })
                    }
                });
            });
        });
    </script>

</body>

</html>