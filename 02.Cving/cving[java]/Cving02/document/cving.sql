drop database cving;
create database cving;
use cving;

create table user
(
	uno int primary key AUTO_INCREMENT comment '회원번호',
	uid varchar(100) comment '아이디',
	upw varchar(100) comment '비밀번호',
	uname varchar(100) comment '회원이름',
	ubirth varchar(50) comment '생년월일',
	ugender varchar(5) comment '회원성별'
);

create table movie
(
	mcode  varchar(50) primary key comment '영화코드',
	mtitle varchar(255) comment '영화이름',
	mhobby varchar(100) comment '장르',
	mscore decimal(5,2) comment '평점',
	mtime varchar(100) comment '러닝타임',
	openyear varchar(20) comment '개봉년도',
	makingyear varchar(20) comment '제작년도',
	male int comment '남성선호도',
	female int comment '여성선호도',
	teenage int comment '10대 선호도',
	twenty int comment '20대 선호도',
	thirty int comment '30대 선호도',
	forty int comment '40대 선호도',
	fifty int comment '50대 선호도',
	mstory TEXT comment '영화스토리',
	mposter varchar(300) comment '영화포스터',
	mimg varchar(300) comment '영화이미지',
	used varchar(2) default 'Y' comment '사용여부'
);

create table hobby
(
	uno int comment '회원번호',
	hobby varchar(50) comment '장르명',
	foreign key (uno) references user(uno)
	
);

create table genre
(
	mcode  varchar(50) comment '영화코드',
	mhobby varchar(100) comment '영화장르',
	foreign key (mcode) references movie(mcode)
);