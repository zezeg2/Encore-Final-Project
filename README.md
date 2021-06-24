# Encore-Final-Project
Encore Final Project- Project name : BOGOSA

**언택트 비즈니스를 위한 멀티클라우드 아키텍트 양성과정 Final Project**



## **클라우드 보안을 고려한 라이브 스트리밍 이커머스 서비스 개발**

**라이브 커머스란?**

- 코로나 팬대믹 시대에 온라인 판매시장의 성장과 함께 확대되고 있는 새로운 형태의 쇼핑 플랫폼

- 채팅으로 소비자와 소통하면서 상품을 소개하는 형태의 스트리밍 방송

- 라이브 커머스를 이용하는 사람의 대다수가 20-30대의 시장에서 성장 가능성이 높은 구매층이다.

- 누구나 셀러가 될 수 있어 판매자와 구매자의 경계가 없다

- 소통과 쇼핑을 결합해 재미를 극대화
- -IT 대기업 중심으로 라이브 커머스 플랫폼이 런칭되고 있다
- 국내의 강력한 모바일 네트워크 인프라를 기반으로 라이브 스트리밍이 원활하여 빠른 속도로 시장이 성장할 것으로 전망 

> 시장이 확대되는 단계이며 주 소비층이 소비력이 증가하는 단계이므로 **블루오션** 비즈니스라고 할 수 있다.



**비즈니스 요구사항 ?** 

1)**고객 데이터 베이스 보안 요구사항 준수누구나 거래를 하기 위해 스트리밍 할 수 있는 플랫폼**

2)**개인/기업 거래방식 차이를 고려한 서비스 제공**

-**회원에 따라 다양한 형태의 거래가 가능하도록 UI/UX(중고거래, 일반판매, 직거래)**

**3)**   **시청자와 소통하며 정보를 실시간으로 피드백 함으로써 제품에 대한 신뢰성 확보**

  **- 라이브 채팅이 가능하도록** 

4)   방송 다시 보기 기능으로 라이브 방송 이후에도 구매 활성화 

5)   광고와 상품 판매로 발생하는 수수료를 기반으로 수익창출

6)   최저 자금으로 서비스 런칭 가능 및 서비스 유지 비용 최적화

**7)**   **핵심 서비스인 스트리밍 서버의 안정성 확보**



**기능 요구사항**

![img](https://lh5.googleusercontent.com/zWPOKbq-OrDYY5qrODnaAG_IeiXw3I94dQgcd3XlVzGXXXFck_WtWg3d016Zzuwxs9QK0iPcOUwxp3Jq3qg0WgAaB-RAhUKk5cKO-Ejrb4NuMsHUCUs30UaRAbgC0VLS)

**아키텍처 요구사항 ?**

1) 서비스 중인 하나의 Available Zone에서 장애 발생시에도 연속적인 서비스 제공이 가능해야 한다.

2) 요청이 급격하게 증가하더라도 서비스에 장애가 일어나지 않도록 해야 한다.

3) 웹사이트 공격으로부터 보호되어야 한다.

4) 클라이언트의 지리적 위치에 관계없이 균일한 품질의 서비스를 제공해야 한다.

5) 하드웨어 프로비저닝, 데이터베이스 설정, 패치 및 백업과 같은 시간 소모적인 관리 작업을 자동화하면서 비용 효율적이고 크기 조정가능한 데이터베이스 서비스를 제공해야 한다.

6) 완전관리형 실시간 스트리밍 서비스를 사용하여 자동으로 확장가능하고 안정적인 웹서비스 제공이 가능해야 한다.



**ERD**

![img](https://lh3.googleusercontent.com/5ZymSMWtvWevo3WIs4b_rNrocrd1bCvK9rfOZa0u9pS3L6pRUijhKu1ooiBp7VfV_ysIvqqJKjeDHRAv8EuaHISjl6JMluzpEvKO2p-eKKkqghUOPcjt-P-VxSBP2rl_4ehoNxI)

- 유저 테이블

- 상품(방송)테이블

- 방송 채팅 테이블

- 라이브 예고 테이블

- 라이브 예고 댓글 테이블

- 리뷰 테이블

- 주문기록, 판매기록 테이블



**개발환경**

![img](https://lh4.googleusercontent.com/tuS6msD-zSWqKfEJTb9SdnEIK9MHzV8K-5v2Zn_kymygFhFAEt6LnHrl2o5Ret-b9kuQPnklKxGPB89GqGHa83b9a3kHRazcQwBJqiyJQXyUzVsKjnRyFwr6MciUgUOI)



**아키텍처 구성도**

![img](https://lh5.googleusercontent.com/0Zw3DjO94h1GtUtQNgeI3rCnLKwI6PKudyUpiMwEe59hjS45eJCMxOQGESoYEgqX8uKR-vV61eFdQOikeqsFJxzU81VO2UOFhVcqb1WmPzp2V1WH9Kq26_kkopefT-Jm4CyUW4c)



**서비스 요약**

- 라이브 스트리밍 서비스 – AWS Interactive Video Service(IVS)

- CDN 아키텍처 – S3, Lambda, AWS Media Converter, Cloudfront, CloudFormation

- 고가용성 고객 데이터 베이스 - RDS(MySQL) Master and Slave

- 보안을 고려한 아키텍처 - VPC, IAM, Cognito, WAF

- 고가용성 서비스 배포 Strategy – EC2, Multi-AZ Auto scaling and Load Balancing



**상세 내용 문서참조 ...**
