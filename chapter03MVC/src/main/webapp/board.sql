create table board(
    num int auto_increment primary key,
    writer varchar(20),
    email varchar(50),
    subject varchar(50),
    password varchar(10),
    reg_date date,
    ref int,
    re_step int,
    readcount int,
    content varchar(1000),
    id varchar(10)
);
    
INSERT INTO board (writer, email, subject, password, reg_date, ref, re_step, readcount, content, id) VALUES
('admin',  'admin@naver.com',  '공지사항입니다',        '1234', '2026-10-01', 1, 0, 25, '게시판 이용 규칙을 안내드립니다.',          'admin'),
('baek17', 'baek17@naver.com', '캠핑 장비 추천해주세요', '1717', '2026-10-03', 2, 0, 12, '초보자가 쓰기 좋은 텐트 추천 부탁드려요.',   'baek17'),
('choi05', 'choi05@naver.com', '주말 캠핑 후기',         '5555', '2026-10-05', 3, 0, 18, '가평으로 다녀왔는데 정말 좋았습니다.',       'choi05'),
('han10',  'han10@naver.com',  '요즘 읽는 책 공유해요',  '1010', '2026-10-08', 4, 0, 9,  '이번 달에 읽은 책 중 추천할 만한 책입니다.', 'han10'),
('hong01', 'hong01@naver.com', '영화 추천 부탁드립니다', '1111', '2026-10-10', 5, 0, 15, '최근 개봉한 영화 중 볼만한 것 있을까요?',   'hong01'),
('jang',   'kjb@naver.com',    '안녕하세요 가입인사',    '1111', '2026-10-12', 6, 0, 7,  '새로 가입했습니다. 잘 부탁드립니다.',        'jang'),
('jang19', 'jang19@naver.com', 'RE: 캠핑 장비 추천',     '1919', '2026-10-15', 2, 1, 4,  '저는 2인용 돔텐트를 추천드려요.',            'jang19'),
('jung06', 'jung06@naver.com', 'RE: 영화 추천',          '6666', '2026-10-18', 5, 1, 6,  '요즘 개봉작 중에 스릴러가 재미있습니다.',    'jung06'),
('kang07', 'kang07@naver.com', 'RE: 캠핑 장비 추천',     '7777', '2026-10-22', 2, 2, 3,  '장비는 대여해서 먼저 써보셔도 좋아요.',      'kang07'),
('kim03',  'kim03@naver.com',  '등산 영화 모임 후기',    '3333', '2026-10-27', 7, 0, 6,  '지난 모임 정말 즐거웠습니다. 감사합니다.',   'kim03');

create table carProduct(
    no int auto_increment primary key,  -- 자동차 식별자
    carName varchar(20),                -- 자동차 이름
    price int,                          -- 자동차 가격
    company varchar(50),                -- 자동차 회사
    img varchar(50),                    -- 자동차 이미지
    info varchar(500)                   -- 자동차 설명
);

insert into carProduct (carName, price, company, img, info) values
('Veyron',     2000000000, 'Bugatti',   '1.jpg',  '초고성능 슈퍼카입니다.'),
('NSX',        180000000,  'Honda',     '2.jpg',  '하이브리드 스포츠카입니다.'),
('Fortwo',     25000000,   'Smart',     '3.jpg',  '도심형 초소형 모델입니다.'),
('Pony',       15000000,   'Hyundai',   '4.jpg',  '한국 자동차의 시작을 알린 클래식 모델입니다.'),
('Concept X',  500000000,  'Future',    '5.jpg',  '미래형 콘셉트카입니다.'),
('Mini',       42000000,   'BMW',       '6.jpg',  '개성 있는 소형 해치백입니다.'),
('Sonata',     35000000,   'Hyundai',   '7.jpg',  '편안한 중형 세단입니다.'),
('Avante',     28000000,   'Hyundai',   '8.jpg',  '인기 준중형 세단입니다.'),
('Ioniq5',     55000000,   'Hyundai',   '9.jpg',  '전기차 전용 모델입니다.'),
('Concept EV', 600000000,  'Future',    '10.jpg', '미래형 전기차입니다.'),
('A4',         60000000,   'Audi',      '11.jpg', '프리미엄 중형 세단입니다.'),
('K3',         26000000,   'Kia',       '12.jpg', '가성비 좋은 세단입니다.'),
('Corvette',   150000000,  'Chevrolet', '13.jpg', '미국 스포츠카입니다.'),
('Mustang',    120000000,  'Ford',      '14.jpg', '머슬카의 상징입니다.'),
('Seltos',     32000000,   'Kia',       '15.jpg', '소형 SUV 모델입니다.'),
('Grandeur',   45000000,   'Hyundai',   '16.jpg', '준대형 세단입니다.'),
('GHybrid',    50000000,   'Hyundai',   '17.jpg', '하이브리드 세단입니다.'),
('G80',        90000000,   'Genesis',   '18.jpg', '프리미엄 대형 세단입니다.'),
('Muscle',     80000000,   'Dodge',     '19.jpg', '강력한 머슬카입니다.'),
('Coupe',      70000000,   'Chevrolet', '20.jpg', '클래식 쿠페 모델입니다.');