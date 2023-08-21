<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!--JSP 標籤，用於設置網頁的語言和編碼方式-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-Hant">

<!-- 網頁的設定和樣式 css -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi">
    <!-- 頁面標題 -->
    <title>DIYLA! || 美好的體驗</title>

    <!-- 引入不同的CSS樣式表 -->
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
</head>

<body>
<!-- 主要的網頁內容 js html-->
<!--
=============================
MENU DETAILS START
==============================
-->
<section class="tf__menu_details mt_100 xs_mt_75 mb_95 xs_mb_65">
    <div class="container">
        <div class="row">

            <div class="col-12 wow fadeInUp" data-wow-duration="1s">
                <div class="tf__menu_description_area mt_100 xs_mt_70">
                    <ul class="nav nav-pills" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-home-tab"
                                    data-bs-toggle="pill" data-bs-target="#pills-home"
                                    type="button" role="tab" aria-controls="pills-home"
                                    aria-selected="true">訂位須知
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pills-contact-tab"
                                    data-bs-toggle="pill" data-bs-target="#pills-contact"
                                    type="button" role="tab" aria-controls="pills-contact"
                                    aria-selected="false">評論區
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade" id="pills-home" role="tabpanel"
                             aria-labelledby="pills-home-tab" tabindex="0">
                            <div class="menu_det_description">
                                <p>訂位前請詳讀資訊以確保您的權益.
                                </p>
                                <ul>
                                    <li>● 因安全考量，無論是否有大人陪同，都無法接待12歲以下小朋友。
                                        (為避免小朋友年齡爭議，請攜帶可證明年齡之相關證件，供必要時核對)
                                    </li>
                                    <li>● 訂位『僅保留15分鐘』須全員到齊，逾時請現場候位。
                                        (晚上最後一場，逾時15分鐘就無法入場)
                                    </li>
                                    <li>● 甜點製作環境，寵物無法入店。</li>
                                    <li>● 店內嚴禁：外食、菸、酒、檳榔。</li>
                                    <li>● 每一場製作時間為3小時。(包含：製作、烘烤、清洗、裝飾、包裝)</li>
                                    <li>● 甜點製作為：平板教學+自助取材料。 (無老師教學、無販售成品、需自行清洗用具)</li>
                                    <li>● 費用依『甜點價格』收費。(無服務費)</li>
                                    <li>● 一份甜點價格限一人製作，其餘人數皆加收陪同費$100/人。</li>
                                </ul>


                                <ul>

                                    <li>Lorem ipsum dolor sit amet consectetur adipisicing
                                        elit Doloribus.
                                    </li>
                                    <li>Dolor sit amet consectetur adipisicing elit. Earum
                                        itaque nesciunt.
                                    </li>

                                </ul>
                                <p>Lorem ipsum dolor, sit amet consectetur adipisicing
                                    elit. Doloribus consectetur ullam in? Beatae, dolorum ad ea .</p>
                            </div>
                        </div>

                        <div class="tab-pane fade show active" id="pills-contact"
                             role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
                            <div class="tf__review_area">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <h4 id="count"></h4>
                                        <div class="sortOption">
                                            <div class="sortText">留言&nbsp;</div>
                                            <div id="sortByDateNew" onclick="toggleSort('date', 'new')"
                                                 class="sortText active">新&nbsp;|&nbsp;
                                            </div>
                                            <div id="sortByDateOld" onclick="toggleSort('date', 'old')"
                                                 class="sortText">舊
                                            </div>

                                            &nbsp;&nbsp;
                                            <div class="sortText">評分星星數&nbsp;</div>
                                            <div id="sortByRatingHigh" onclick="toggleSort('rating', 'high')"
                                                 class="sortText active">高&nbsp;|&nbsp;
                                            </div>
                                            <div id="sortByRatingLow" onclick="toggleSort('rating', 'low')"
                                                 class="sortText">低
                                            </div>
                                        </div>
                                        <div id="commentContainer" class="tf__comment pt-0 mt_20">
                                            <!-- 其他内容 -->
                                        </div>

                                    </div>
                                    <div class="col-lg-4">
                                        <div class="tf__post_review">
                                            <h4>新增評論</h4>
                                            <form id="myForm" onsubmit="submitForm(event)"
                                                  action="/diyla_back/diy/DiyForumController" method="GET">
                                                <p class="rating">
                                                    <span>選擇評分數 : </span> <i class="fas fa-star"></i> <i
                                                        class="fas fa-star"></i> <i class="fas fa-star"></i> <i
                                                        class="fas fa-star"></i> <i class="fas fa-star"></i>
                                                </p>
                                                <div class="row">
                                                    <%--<div class="col-xl-12">--%>
                                                    <%--    <input type="text" placeholder="Name">--%>
                                                    <%--</div>--%>
                                                    <%--<div class="col-xl-12">--%>
                                                    <%--    <input type="email" placeholder="Email">--%>
                                                    <%--</div>--%>
                                                    <input type="hidden" name="action" value="add">

                                                    <%--  TODO 整合項目後可以使用商品詳情頁面No --%>
                                                    <input type="hidden" name="diyNo" value="4"> <input
                                                        type="hidden" name="diyGrade" value="0">

                                                    <div class="col-xl-12">
                                                        <textarea rows="3" placeholder="請輸入評論內容"
                                                                  name="artiCont"></textarea>
                                                    </div>
                                                    <div class="col-12">
                                                        <button class="common_btn" type="submit">提交</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<!--=============================
MENU DETAILS END
==============================-->


<!--=============================
SCROLL BUTTON START
==============================-->
<!-- 捲動按鈕 -->

<div class="tf__scroll_btn">
    <i class="fas fa-hand-pointer"></i>
</div>
<!--=============================
SCROLL BUTTON END
==============================-->

<!-- 引入必要的 JavaScript  -->
<!--jquery library js-->
<script src="/diyla_front/diy/js/jquery-3.6.0.min.js"></script>
<!--bootstrap js-->
<script src="/diyla_front/diy/js/bootstrap.bundle.min.js"></script>
<!--font-awesome js-->
<script src="/diyla_front/diy/js/Font-Awesome.js"></script>
<!-- slick slider -->
<script src="/diyla_front/diy/js/slick.min.js"></script>
<!-- isotop js -->
<script src="/diyla_front/diy/js/isotope.pkgd.min.js"></script>
<!-- counter up js -->
<script src="/diyla_front/diy/js/jquery.waypoints.min.js"></script>
<script src="/diyla_front/diy/js/jquery.countup.min.js"></script>
<!-- nice select js -->
<script src="/diyla_front/diy/js/jquery.nice-select.min.js"></script>
<!-- venobox js -->
<script src="/diyla_front/diy/js/venobox.min.js"></script>
<!-- sticky sidebar js -->
<script src="/diyla_front/diy/js/sticky_sidebar.js"></script>
<!-- wow js -->
<script src="/diyla_front/diy/js/wow.min.js"></script>
<!-- ex zoom js -->
<script src="/diyla_front/diy/js/jquery.exzoom.js"></script>

<!--main/custom js-->
<script src="/diyla_front/diy/js/main.js"></script>


<!-- 自訂的 JavaScript 腳本 -->
<script>

    // 自訂的 JavaScript 腳本，處理評論和表單相關的操作
    let starIndex = 0;
    let sortParam = "cSort=DESC";

    function getList(s) {
        // 使用 AJAX 請求從伺服器端獲取 JSON 數據
        var xhr = new XMLHttpRequest();
        var url = 'http://localhost:8081/diyla_back/diy/diy-forum/list'; // Servlet URL
        // 後期需要傳入當前 diyNo，目前預設值為4
        var params = '&diyNo=4'; // 請求參數，以鍵值對形式拼接

        if (s == null || s == "") {
            params += "&page=1&cSort=DESC";
        } else {
            params += s;
        }

        xhr.open('GET', url + '?' + params, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var jsonData = JSON.parse(xhr.responseText);
                renderComments(jsonData);
            }
        };
        xhr.send();
    }

    getList(null);

    // 渲染評論列表
    function renderComments(data) {
        var commentContainer = document.getElementById('commentContainer');
        if (data.length === 0) {
            commentContainer.innerHTML = '<p>評論列表為空。</p>';
        } else {
            var html = '';
            for (var i = 0; i < data.content.length; i++) {
                var item = data.content[i];
                html += '<div class="tf__single_comment">';
                html += '<img src="/diy/picture/client_1.png" alt="review" class="img-fluid">';
                html += '<div class="tf__single_comm_text">';
                html += '<h3>' + item.memName + '</h3>';
                html += '<h6 style="color: #ff7c08">' + item.createTime + '</h6>';
                html += '<span class="rating">';
                for (var j = 0; j < item.diyGrade; j++) {
                    html += '<i class="fas fa-star"></i>';
                }
                html += '</span>';
                html += '<p>' + item.artiCont + '</p>';
                html += '</div>';
                html += '</div>';
            }
            document.getElementById("count").innerText = data.totalElements + " 評論";
            // commentContainer.innerHTML = html;

            // 增加分頁
            // var paginationContainer = document.querySelector(".tf__pagination");
            var currentPage = data.number + 1;   // 當前頁數
            var totalPages = data.totalPages;    // 總頁數

            //&page=1&commentSort=DESC
            var preParams = "";
            if (currentPage != 1) {
                preParams = "&page=" + (currentPage - 1) + "&cSort=DESC";
            }

            var nextParams = "";
            if (currentPage != totalPages) {
                nextParams = "&page=" + (currentPage + 1) + "&cSort=DESC";
            }

            var paginationHtml = '';
            paginationHtml += '<div class="tf__pagination mt_30">';
            paginationHtml += '<div class="row">';
            paginationHtml += '<div class="col-12">';
            paginationHtml += '<nav aria-label="...">';
            paginationHtml += '<ul class="pagination">';
            paginationHtml += '<li class="page-item">';
            paginationHtml += '<a class="page-link" onclick="getList(\'' + preParams + '\')"><i class="fas fa-long-arrow-alt-left" style="margin-top: 16px"></i></a>';
            paginationHtml += '</li>';
            for (var page = 1; page <= totalPages; page++) {
                if (page === currentPage) {
                    paginationHtml += '<li class="page-item active"><a class="page-link" href="#">' + page + '</a></li>';
                } else {
                    var params = "&page=" + page + "&cSort=DESC";
                    paginationHtml += '<li class="page-item"><a class="page-link" onclick="getList(\'' + params + '\')">' + page + '</a></li>';
                }
            }

            paginationHtml += '<li class="page-item">';
            paginationHtml += '<a class="page-link" onclick="getList(\'' + nextParams + '\')"><i class="fas fa-long-arrow-alt-right" style="margin-top: 16px"></i></a>';
            paginationHtml += '</li>';
            paginationHtml += '</ul>';
            paginationHtml += '</nav>';
            paginationHtml += '</div>';
            paginationHtml += '</div>';
            paginationHtml += '</div>';
            paginationHtml += '</div>';

            commentContainer.innerHTML = html + paginationHtml;
        }
    }

    // 獲取所有星星
    var stars = document.querySelectorAll('.rating i');
    //當使用者點擊某個星星時，該星星及其之前的星星都會被設定為選中樣式（改變顏色），而該星星之後的星星都會被設定為未選中樣式
    stars.forEach(function (star, index) {
        star.addEventListener('click', function () {
            stars.forEach(function (s, sIndex) {
                if (sIndex <= index) {
                    s.classList.add('selected');
                } else {
                    s.classList.remove('selected');
                }
            });
        });
    });

    //獲取所有星星
    var stars = document.querySelectorAll('.rating i');

    // 遍歷每個星星元素，為其添加點擊事件監聽器,
    // 為每個星星元素添加一個 "click" 點選事件監聽器。當使用者點選某個星星時，指定的事件處理函式將被執行。
    stars.forEach(function (star, index) {
        star.addEventListener('click', function () {
            // 讓前面的星星都亮起來
            for (var i = 0; i <= index; i++) {
                stars[i].classList.add('selected');
            }
            // 讓後面的星星恢復本來的樣式
            for (var i = index + 1; i < stars.length; i++) {
                stars[i].classList.remove('selected');
            }
            // 將選取的索引位置加 1，因陣列的索引從 0 開始，星星評分中是 1 到 5 星。
            var selectedIndex = Array.from(stars).indexOf(this);
            console.log("Selected Index:", selectedIndex);
            starIndex = selectedIndex + 1;
        });
    });
    //處理表單提交，將評論數據通過 AJAX 請求傳送到伺服器，然後根據伺服器的回應處理相應的操作。
    //當使用者提交表單時，這個函式將被呼叫。
    function submitForm(event) {
        // 阻止預設提交表單行為
        event.preventDefault();

        // 獲取表單數據
        // FormData 物件來獲取表單中的數據。event.target 是觸發事件的表單元素。
        var formData = new FormData(event.target);
        //從表單數據中獲取名為 "diyNo" 的值。
        var diyNo = formData.get("diyNo");
        var diyGrade = starIndex;
        //獲取使用者輸入的評論內容
        var artiCont = formData.get("artiCont");
        //預設一個的會員 ID:4
        var memberId = 4;

        //創建一個新的 XMLHttpRequest 物件，用於發送 AJAX 請求。
        var xhr = new XMLHttpRequest();
        //指定要發送請求的 URL
        var url = 'http://localhost:8081/diyla_back/diy/diy-forum/add'; // Servlet URL
        var params = 'diyNo=' + diyNo + "&diyGrade=" + diyGrade + "&artiCont=" + artiCont + "&memId=" + memberId; // 請求參數，以鍵值對形式拼接
        xhr.open('GET', url + '?' + params, true);
        xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

        //函式內部，檢查狀態是否為 4（表示請求已完成）且狀態碼是否為 200（表示成功）。
        // 如果滿足這些條件，則解析伺服器的回應文本，處理相應的邏輯並呼叫 getList(null); 來重新獲取評論列表。
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 請求成功後處理邏輯
                var r = JSON.parse(xhr.responseText);
                console.log(r);
                getList(null);
            }
        };
        xhr.send();
    }


    let sortBy = 'date'; //預設按留言新舊排序
    let sortDirection = 'new'; //預設按照新評論排序

    function toggleSort(sortType, direction) {
        sortBy = sortType;
        sortDirection = direction;

        // 排序選項將以橘色顯示 留言: 新/舊 , 評分:高/低
        document.getElementById('sortByDateNew').style.color = direction === 'new' ? '#ff7c08' : 'initial';
        document.getElementById('sortByDateOld').style.color = direction === 'old' ? '#ff7c08' : 'initial';
        document.getElementById('sortByRatingHigh').style.color = direction === 'high' ? '#ff7c08' : 'initial';
        document.getElementById('sortByRatingLow').style.color = direction === 'low' ? '#ff7c08' : 'initial';
        // 排序邏輯
        // 檢查變數 sortBy 的值。如果 sortBy 等於 'date'，則調用 sortByDate() 函式來執行根據日期排序的相關邏輯。
        // 如果 sortBy 等於 'rating'，則調用 sortByRating() 函式來執行根據評分排序的相關邏輯。
        if (sortBy === 'date') {
            sortByDate();
            //根據星星數多寡排序
        } else if (sortBy === 'rating') {
            sortByRating();
        }
    }

    function sortByDate() {
        // 留言新舊排序邏輯
        if (sortDirection === 'new') {
            sortParam = "&cSort=DESC"
            getList(sortParam);
        } else {
            sortParam = "&cSort=ASC"
            getList("&cSort=ASC");

        }
    }

    function sortByRating() {
        // 按評分星數排序邏輯
        if (sortDirection === 'high') {
            sortParam = "&sSort=DESC"
            getList("&sSort=DESC");
        } else {
            sortParam = "&sSort=ASC"
            getList("&sSort=ASC");

        }
    }

</script>
<style>

    .rating i.selected {
        color: red !important;
    / / 選中時的顏色，可根據需要自行修改
    }


    .sortOption {
        display: flex;
    }

    .sortText {
        /*padding: 10px;*/
        cursor: pointer;
    }

    .sortText.active {
        /*background-color: lightblue;*/
    }

</style>

</body>

</html>
