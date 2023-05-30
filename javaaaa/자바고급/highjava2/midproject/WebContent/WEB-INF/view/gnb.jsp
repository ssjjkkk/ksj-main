<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/gnb.css?<?php echo time() ?>">
<!-- 글로벌 네비게이션 바 부분 -->
<header class="gnb">
    <div class="container">
        <div class="logo"><a href="../index.do"><img src="../img/gnb_redapp_logo_v2.png"></a></div>
        <div class="gnbBarLeft">
            <div class="gnbAllmenu">
                 <a href="#gnbAllLayer" data-bs-toggle="offcanvas" data-bs-target="#gnbAllLayer" aria-controls="gnbAllLayer">
                    <span class="gnbIcon"></span><span class="text">메뉴</span>
                </a>
            </div>
        </div> 
        <div class="gnbBarRight">
            <div class="member-info">
                <?php
                    if ($is_member) {
                ?>
                <a class="btn btn-basic" href="logout.do">로그아웃</a>
                <?php } else { ?>
                <a class="btn btn-basic" href="login.do">로그인</a>
                <?php } ?>
            </div>
        </div>
    </div>
</header>
<div class="offcanvas offcanvas-start gnbAllLayer" data-bs-scroll="true" tabindex="-1" id="gnbAllLayer" aria-labelledby="gnbAllLayerLabel">
    <div class="gnbTitle">
        <h2>Global Navigation Bar</h2>
    </div>
    <div class="gnbLayerBt">
        <a href="#" data-bs-dismiss="offcanvas" aria-label="Close">
            <span class="gnbIcon"></span>
        </a>
    </div>
    <div class="gnbMyLayer">
        <div class="gnbList">
            <div class="gnbCell">
                <h3><a href="index.do">HOME <i class="bi bi-link-45deg"></i></a></h3>
                <h3><a href="lounge/index.do">게임 라운지 <i class="bi bi-link-45deg"></i></a></h3>
                <h3>종합랭킹</h3>
                <ul>
                    <li><a href="ranking/lounge.do">게임랭킹</a></li>
                    <li><a href="ranking/subscribe.do">구독랭킹</a></li>
                </ul>
            </div>
            <div class="gnbCell">
                <h3><a href="https://news.kmib.co.kr/article/list.asp?sid1=spo&sid2=0012">e스포츠 <i class="bi bi-link-45deg"></i></a></h3>
                <h3><a href="customer/index.do">고객센터 <i class="bi bi-link-45deg"></i></a></h3>
                <ul>
                    <li><a href="customer/company.do">사이트소개</a></li>
                    <li><a href="customer/notice.do">공지사항</a></li>
                    <li><a href="customer/faq.do">자주묻는질문</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="gnbListService">
        <h2 class="d-none">서비스</h2>
        <ul>
            <li><a href="member/myinfo.do"><span></span>내정보</a></li>
            <li><a href="customer/index.do"><span></span>고객센터</a></li>
            <li><a href="customer/notice.do"><span></span>공지사항</a></li>
            <li><a href="customer/faq.do"><span></span>자주묻는질문</a></li>
        </ul>
        <a class="gnbBtAll" href="sitemap.do">전체서비스</a>
    </div>
</div>