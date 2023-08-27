<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!--JSP 標籤，用於設置網頁的語言和編碼方式-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/front_header.jsp"/>

<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="/diyla_front/images/DIYLA_cakeLOGO.png" type="image/x-icon">
    <link rel="stylesheet" href="/diyla_front/diy/css/all.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/bootstrap.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/slick.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/nice-select.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/venobox.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/animate.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/jquery.exzoom.css">

    <link rel="stylesheet" href="/diyla_front/diy/css/spacing.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/style.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/responsive.css">

    <title>
        商店
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/css/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="/diyla_front/css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="/diyla_front/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="/diyla_front/css/responsive.css" rel="stylesheet"/>
    <link href="//unpkg.com/layui@2.8.15/dist/css/layui.css" rel="stylesheet">

</head>

<body>
<div class="hero_area">

</div>
<section class="tf__reservation mt_100 xs_mt_70 mb_100">
    <div class="container">
        <div class="tf__reservation_bg"
             style="background: url(https://images.unsplash.com/photo-1593558159516-d0be2a960c52?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80);">
            <div class="row">
                <div class="col-xl-6 ms-auto">
                    <div class="tf__reservation_form wow fadeInRight" data-wow-duration="1s">
                        <h2>DIY訂位</h2>
                        <form>
                            <style>
                                textarea {
                                    white-space: pre-wrap;
                                    resize: both;
                                }
                            </style>
                            <div class="tf__reservation_input_single">
                                <label for="name">Food items</label>
                                <!--<input type="text" style="height: 110px;" id="name" placeholder="蛋糕、餅乾...">-->
                                <textarea rows="4" cols="10" style="height: 110px; text-align: left"
                                          placeholder="蛋糕、餅乾...">

                                    </textarea>


                            </div>

                            <div class="row">
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="name">name</label>
                                        <input type="text" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="email">email</label>
                                        <input type="email" id="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="phone">phone</label>
                                        <input type="text" id="phone" placeholder="Phone">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="date">select date</label>
                                        <!--<input type="date" id="date">-->
                                        <input type="text" id="ID-laydate-mark" placeholder="yyyy-MM-dd">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label>select time</label>
                                        <select id="select_time" class="reservation_input select_js">
                                            <option value="" disabled="true">select</option>
                                            <option value="0">09.00 am to 12.00 pm</option>
                                            <option value="1">13.00 pm to 16.00 pm</option>
                                            <option value="2">18.00 pm to 21.00 pm</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label>select person</label><br>
                                        <select class="reservation_input select_js">
                                            <option value="">select</option>
                                            <option value="1">1 person</option>
                                            <option value="2">2 person</option>
                                            <option value="3">3 person</option>
                                            <option value="4">4 person</option>
                                            <option value="5">5 person</option>
                                            <option value="6">6 person</option>
                                            <option value="7">7 person</option>
                                            <option value="8">8 person</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="tf__reservation_input_single">
                                    <label for="name">Total</label>
                                    <input type="text" id="name" placeholder="品項總金額+人頭費用(100/人)">
                                </div>
                                <div class="col-xl-12">
                                    <button type="button" class="common_btn">訂位確認</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer section -->

<jsp:include page="/front_footer.jsp"/>


<!-- end info section -->


<script src="/diyla_front/js/jquery-3.4.1.min.js"></script>
<script src="/diyla_front/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="/diyla_front/js/custom.js"></script>
<script src="//unpkg.com/layui@2.8.15/dist/layui.js"></script>

<script>

    // 取得專案路徑
    // 從請求中取得專案的上下文路徑（Context Path），用於建構請求的URL路徑。
    // 例如：<%= request.getContextPath() %> 可能會被替換成類似 "/myproject" 的字串。

    layui.use(['laydate', 'layer'], function () {
        var laydate = layui.laydate;
        var layer = layui.layer;

        // 監聽點擊事件
        // 當特定的HTML元素（這裡是ID為 'ID-laydate-mark' 的元素）被點擊時，觸發以下邏輯。

        $('#ID-laydate-mark').on('click', function () {
            // 取得選定的日期值
            var selectedDate = $(this).val();

            // 發送AJAX請求取得數據並渲染日期選框的內容
            $.ajax({
                url: "http://localhost:8081/diyla_back/api/diy-reserve/peoItemQuantityReport",
                // 向指定的URL發起AJAX請求，取得數據以填充日期選框的內容。
                // 請求的數據包括 endDate（選定日期作為結束日期）和 period（時間段）等參數。

                data: {
                    // endDate: selectedDate, // 使用選定的日期作為結束日期
                    period: 0 // 替換為所需的時間段
                },
                success: function (data) {
                    // 請求成功的回調函數，處理從伺服器獲得的JSON數據。

                    let mar = {};
                    let mars = [];

                    // 遍歷伺服器返回的數據
                    for (let x in data) {
                        let itemQuantity = 0;
                        let diyReserveDate = "";

                        for (let xx in data[x]) {
                            mars.push(data[x][xx]);
                            itemQuantity += data[x][xx].itemQuantity;
                            diyReserveDate = data[x][xx].diyReserveDate;
                        }

                        if (itemQuantity >= 30) {
                            mar[diyReserveDate] = '已滿';
                        }
                    }

                    // 處理接收到的JSON數據，並更新日期選擇器的內容
                    // 例如，可以使用 mark: {} 來自訂標記的日期

                    laydate.render({
                        elem: '#ID-laydate-mark',
                        min: 0,
                        max: 60,
                        mark: mar, // 使用接收到的數據來標記日期
                        done: function (value, date) {
                            // 完成選擇日期後的邏輯處理
                            for (let key in mar) {
                                if (key === value) {
                                    layer.msg("無法選擇該日期！", {icon: 2});
                                    $('#ID-laydate-mark').val("");
                                }
                            }

                            let values = [];
                            for (let i = 0; i < mars.length; i++) {
                                if (value === mars[i].diyReserveDate) {
                                    values.push(mars[i].diyPeriod);
                                }
                            }

                            // 移除所有選項的 disabled 屬性
                            $("#select_time option").prop("disabled", false);

                            // 設定是否不可選
                            $("#select_time option").each(function () {
                                let value = $(this).val();

                                for (let i = 0; i < values.length; i++) {
                                    if (values[i] == value) {
                                        $(this).prop("disabled", true);
                                    }
                                }
                            });
                        }
                    });
                },
                error: function (error) {
                    // 請求失敗的回調函數，處理錯誤情況
                    console.log("取得數據出錯：", error);
                    layer.msg("取得數據出錯：" + error.responseText, {icon: 2});
                }
            });
        });
    });
</script>


</body>

</html>
