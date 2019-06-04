1.회원가입 테이블
create table modMember(
id varchar2(20),
ex varchar2(100)
);

create table MEMBER(
id varchar2(20) primary key not null,
password varchar2(20) not null,
name varchar2(10) not null,
email varchar2(50) not null,
address varchar2(100) default '0',--상세주소
zipcode varchar2(10) default '0',--우편번호
account varchar2(20) not null,--계좌번호
profile_img varchar2(30) default '0',
jumin varchar2(10) not null,
phone_num varchar2(20) not null,
status number default '0',--계정상태//0:정상//1:게시글막기// 2:게시글막기+로그인차단
reg_date date not null,
dot_sum number default '0',--계정이 소지한 DOT 총량
authority number default '0'--0 : 회원 1 : 관리자
);

2.LINE 테이블
create table LINE(
LINE_NUM number primary key not null,
LINE_SUBJECT varchar2(20) not null,
LINE_REGDATE date not null,
LINE_IMG varchar2(30) not null
);

3.LINE_NUM 시퀀스
create sequence LINE_NUM_no_seq;

4. 게시글 테이블
create table board(
LINE_NUM NUMBER not null,
BOARD_NUM NUMBER primary key not null,
BOARD_SUBJECT VARCHAR2(200) not null,
BOARD_AUTHOR VARCHAR2(20) not null,--작성자의 아이디
BOARD_CONTENT VARCHAR2(4000) not null,
BOARD_REGDATE DATE not null,
BOARD_UPLOAD VARCHAR2(100) default '0',
BOARD_UP NUMBER default '0',--추천수 DEFAULT = 0
BOARD_DOWN NUMBER default '0',--비추천수 DEFAULT = 0
BOARD_DOT NUMBER default '0', --받은 Dot 총량 DEFAULT = 0
BOARD_SINGO	NUMBER default '0',--신고횟수 DEFAULT = 0
BOARD_READCOUNT NUMBER default '0',
BOARD_STATUS NUMBER default '0'--0 : 정상 / 1 : 블라인드상태
);

5. BOARD_NUM 시퀀스
create sequence BOARD_NUM_no_seq;

6. 댓글 테이블
create table comments(
LINE_NUM NUMBER not null,--라인번호
BOARD_NUM NUMBER not null,--게시글번호
COMMENT_NUM	NUMBER primary key not null,--댓글번호
COMMENT_AUTHOR VARCHAR2(20) not null,--작성자의 아이디
COMMENT_REGDATE	DATE not null,
COMMENT_CONTENT	VARCHAR2(2000) not null,
COMMENT_REF	NUMBER not null,
COMMENT_RE_LEVEL NUMBER not null,
COMMENT_UP NUMBER default '0',
COMMENT_DOWN NUMBER default '0',
COMMENT_STATUS NUMBER default '0'--0 : 정상(기본값) 1 : 삭제된 상태
);

private int line_num;
	private int board_num;
	private int comment_num;
	private String comment_author;
	private Date comment_regdate;
	private String comment_content;
	private int comment_ref;
	private int comment_re_level;
	private int comment_up;
	private int comment_down;
	private int comment_status;

7. COMMENT_NUM 시퀀스
create sequence COMMENT_NUM_no_seq;

8.신고 테이블
create table singo(
SINGO_NUM NUMBER primary key not null,
BOARD_NUM NUMBER not null,
SINGO_REPORTER VARCHAR2(20) not null,--신고자아이디
SINGO_BADMAN VARCHAR2(20) not null,--피신고자 아이디
SINGO_REASON VARCHAR2(1000) not null,--신고사유
SINGO_REGDATE DATE not null
);

9. SINGO_NUM 시퀀스
create sequence SINGO_NUM_no_seq;


10.닷충전 테이블
create table DOT_CHARGE( 
DC_NUM NUMBER primary key not null,
DC_ID VARCHAR2(20) not null,
DC_VALUE NUMBER not null,
DC_STATUS NUMBER default '0',--0 : 대기중(무통장일경우) 1 : 충전완료
DC_DATE	DATE not null,
DC_DATED DATE--충전 승인 날짜
);

11. DC_NUM 시퀀스
create sequence DC_NUM_no_seq;

12.닷환전 테이블
create table DOT_EXCHANGE(
DE_NUM NUMBER primary key not null,
DE_ID VARCHAR2(20) not null,
DE_VALUE NUMBER not null,
DE_STATUS NUMBER default '0',--0 : 대기중 1 : 환전완료
DE_DATE	DATE not null,
DE_DATED DATE -- 승인 날짜
);

13. DE_NUM 시퀀스
create sequence DE_NUM_no_seq;

14. 닷 사용내역 테이블
create table DOT_HISTORY(
DH_NUM NUMBER primary key not null,
DH_DONATION	NUMBER not null,--기부
DH_FROM	VARCHAR2(20) not null,--준사람
DH_TO VARCHAR2(20) not null,--받은사람
DH_DATE	DATE not null,
BOARD_NUM NUMBER not null
);

15. DH_NUM 시퀀스
create sequence DH_NUM_no_seq;

16. 좋아요 글 담기 테이블
create table LIKE_BOARD(
LIKE_NUM NUMBER primary key not null,--좋아요 글 담기 게시판의 글번호
LIKE_ID	VARCHAR2(20) not null,--즐겨찾기를 한 사람의 아이디
ORG_BOARD_NUM NUMBER not null--즐겨찾기를 한 게시물의 NUMBER
);

17. LIKE_NUM 시퀀스
create sequence LIKE_NUM_no_seq;









