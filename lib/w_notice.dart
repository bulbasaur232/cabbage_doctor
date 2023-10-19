import 'package:bug_doctor/vo_notice.dart';
import 'package:flutter/cupertino.dart';

class NoticeForm extends StatefulWidget {
  const NoticeForm({super.key});

  @override
  State<NoticeForm> createState() => _NoticeFormState();
}

class _NoticeFormState extends State<NoticeForm> {
  int pageNum = 0;
  late void Function(int) callback;
  
  @override
  void initState() {
    super.initState();
    callback = (int num){
      setState(() {
        pageNum = num;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NoticeType(headLines, pageNum, callback),
        SizedBox(
          height: 305,
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [...post[pageNum].map((p) => Post(p))],
          ),
        )
      ],
    );
  }
}

class NoticeType extends StatelessWidget {
  final List<String> types;
  final int pageNum;
  final Function(int) onTap;

  const NoticeType(this.types, this.pageNum, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        ...types.map((type) {
          return GestureDetector(
            onTap: () => onTap(headLines.indexOf(type)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                type,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      types.indexOf(type) == pageNum ? FontWeight.bold : null,
                  color: types.indexOf(type) == pageNum
                      ? const Color(0xffc73129)
                      : CupertinoColors.inactiveGray,
                ),
              ),
            ),
          );
        }),
        const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                CupertinoIcons.chevron_down,
                color: Color(0xffc73129),
              ),
              SizedBox(width: 15)
            ],
          ),
        )
      ],
    );
  }
}

class Post extends StatelessWidget {
  final Notice notice;

  const Post(this.notice, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        border: BorderDirectional(top: BorderSide(width: 1, color: Color(0xffdcdee3)))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notice.headLine, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          const SizedBox(height: 3),
          Row(
             children: [
              Text(notice.name, style: const TextStyle(fontSize: 13, color: Color(0xff828386)),),
              const Text(' | ', style: TextStyle(fontSize: 13, color: Color(0xff828386)),),
              Text(notice.date, style: const TextStyle(fontSize: 13, color: Color(0xff828386)),),
            ],
          )
        ],
      ),
    );
  }
}

const headLines = ['일반공지', '예찰정보', '재해정보', '주간정보'];

final post = [
  [
    Notice('서버점검에 따른 예측 서비스 일시중단 안내', '관리자', '2023-12-20'),
    Notice('하반기 챗봇 시스템 기능 개선 사항 알림', '관리자', '2023-12-15'),
    Notice('배추 병해충 관리시스템 예찰입력 간편 매뉴얼 안내', '관리자', '2023-12-04'),
    Notice('2023년 뿌리마름병 및 탄저병 방제 사업지침', '관리자', '2023-11-17'),
    Notice('2022년 뿌리마름병 및 탄저병 방제 사업지침', '관리자', '2022-11-17'),
    Notice('2021년 뿌리마름병 및 탄저병 방제 사업지침', '관리자', '2021-11-17'),
  ],
  [
    Notice('2024년 농촌 담당자 병해충 예찰 자료 안내', '관리자', '2023-12-08'),
    Notice('유아등, 포자채집기 등 예찰장비 운영 요령', '관리자', '2023-11-24'),
    Notice('배추 예찰포, 관찰포 운영 및 NCPMS 입력', '관리자', '2023-11-13'),
    Notice('모자이크병 예방을 위한 예찰 특별 교육 일정 안내', '관리자', '2023-09-24'),
    Notice('노균병 예방을 위한 예찰 특별 교육 일정 안내', '관리자', '2023-08-24'),
  ],
  [
    Notice('겨울철 농작물 냉해 피해 방지 요령', '관리자', '2023-12-23'),
    Notice('집중호우·태풍 피해 농가에 재난지원금·위로금 지급', '관리자', '2023-10-21'),
    Notice('태풍 ‘이슬’ 통과, 농작물 1019.1ha 침수․조풍 피해', '관리자', '2023-09-12'),
    Notice('자연재난 대비 ,농어촌공사 전국 농업시설 순찰 강화', '관리자', '2023-06-02'),
    Notice('자연재난 안내방송 및 일기예보 청취 요령', '관리자', '2023-06-02'),
  ],
  [
    Notice('주간농사정보 제 42호 (2023.10.16.~10.22.)', '관리자', '2023-12-23'),
    Notice('주간농사정보 제 41호 (2023.10.09.~10.15.)', '관리자', '2023-10-21'),
    Notice('주간농사정보 제 40호 (2023.10.02.~10.08.)', '관리자', '2023-09-12'),
    Notice('주간농사정보 제 39호 (2023.09.25.~10.01.)', '관리자', '2023-06-02'),
    Notice('주간농사정보 제 38호 (2023.09.01.~09.24.)', '관리자', '2023-06-02'),
  ],
];
