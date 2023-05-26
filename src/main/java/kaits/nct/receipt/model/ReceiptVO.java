package kaits.nct.receipt.model;

import org.apache.ibatis.type.Alias;
import org.jetbrains.annotations.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@Alias("ReceiptVO")
public class ReceiptVO {
	
	private int index; //?
	@NotNull
	
	// 공통 사용 코드 
	private String rcptCode;  // 접수 번호 고유 코드
	private String rcptComCode;  // 대상 기업 코드 kaits_com_member > CPN_ID
	private String rcptTypeCodeNm; // 대상기업명
	private String rcptMetaCode; // 메타 데이터 고유 코드 
	private String metaCode; // 메타 데이터 고유 코드 (검색용 ??)
	private String rcptIdx; // 접수 번호 고유 코드 (검색용)
	private String CpnId;   // 대상 기업 ID (검색용)
	
	// kaits_meta 메타 데이터 
	private String rcptTypeCode; // 메타 데이터 - 접수 분야 
	private String rcptReYn;     // 메타 데이터 - 재검토 접수 여
	private String rcptReCode;   // 메타 데이터 - 접수 번호 고유 코드 (재검토 접수 인 경우) kaits_receipt_stat - RCPT_CODE
	private String rcptTitle;    // 메타 데이터 - 안건 제목
	private String rcptTechForm; // 메타 데이터 - 기술 형태 
	private String rcptExReasonSale;   // 메타 데이터 - 수출 사유 - 매각 여부 Y or Null
	private String rcptExReasonSCom;   // 메타 데이터 - 수출 사유 - 매각 사유  
	private String rcptExReasonTrans;  // 메타 데이터 - 수출 사유 - 이전 여부 Y or Null
	private String rcptExReasonTCom;   // 메타 데이터 - 수출 사유 - 이전 사유  
	private String rcptExReasonEtc;    // 메타 데이터 - 수출 사유 - 기타 여부 Y or Null
	private String rcptExReasonECom;   // 메타 데이터 - 수출 사유 - 기타 사유
	private String rcptExDate;         // 메타 데이터 - 수출 예정일 - YYYY-MM-DD@날짜 미입력시 입력
	private String rcptExDate10;       // 메타 데이터 - 수출 예정일 - 날짜 미입력시 입력???
	private String rcptTechQua;        // 메타 데이터 - 기술 특성 
	private String rcptReason;		   // 메타 데이터 - 신고 사유 
	private String rcptLaw01;          // 메타 데이터 - 신고 사유 법령1 (해외인수·합병 신고)
	private String rcptLaw02;          // 메타 데이터 - 신고 사유 법령2 (해외인수·합병 신고)
	private String rcptLaw03;          // 메타 데이터 - 신고 사유 법령3 (해외인수·합병 신고)
	private String rcptStatusLast;     // 메타 데이터 - 라스트 업데이트 
	private String rcptStatusLast10;   // 메타 데이터 - 라스트 업데이트 ??
	
	// 접수 신청서 상태 
	private String rcptComType;      // 대상 기업 타입 : M: 기업포털 기업, N : 신규 입력 기업, F : 대상기업없음
	private String rcptComTypeNm;    // 대상 기업 타입 네임
	private String rcptStatus;       // 접수 상태  
	private String rcptStatusNm;     // 접수 상태 네임
	private String rcptStatusCode;   // 접수 상태 코드 
	private String rcptView;         // 접수 상태 리스트 노출 여부 (기업 포털)
	private String rcptAView;        // 접수 상태 리스트 노출 여부 (업무 포털)
	private String agdAdmYn;         // 관리자 등록 여부 
	//private String rcptReYn;       // 메타 데이터 - 재검토 접수 여
	//private String rcptReCode;     // 메타 데이터 - 접수 번호 고유 코드 (재검토 접수 인 경우) kaits_receipt_stat - RCPT_CODE
	private String rcptRegId;        // 관리자 등록일 경우 - 관리자 ID
	private String rcptRegDate;      // 접수일 (등록일) 
	private String rcptRegDate10;    // 접수일
	private String rcptRegDateStr;   // 접수일
	private int rcptAgendaCnt;       // 접수 번호로 구성된 안건 수 
	private int rcptCagendaCnt;      // 접수 번호로 구성된 검토 완료된 안건 수  
	private String rcptFixDate;      // 검토 결과 확정일 - (안건 상태로 이동 필요) 
	
	// 대상 기업 정보 
	private String rcptCompanyNm;     // 대상 기업 네임 ?????  
	private String rcptRegiNum;       // 대상기업 사업자 등록 번호 
	private String rcptCompanyCeo;    // 대표자 명
	private String rcptCompanyPost;   // 본사 우편번호
	private String rcptCompanyAdd;    // 본사 주소
	private String rcptCompanyAdd2;   // 본사 상세 주소
	private String rcptCompanyPhone;  // 본사 전화번호 
	private String rcptCompanyPhone1; // 본사 전화 번호 1
	private String rcptCompanyPhone2; // 본사 전화 번호 2 
	private String rcptCompanyPhone3; // 본사 전화 번호 3
	private String rcptCompanyBPost;  // 사업장 우편 번호
	private String rcptCompanyBAdd;   // 사업장 주
	private String rcptCompanyBAdd2;  // 사업장 상세 주소
	private String rcptCompanyBPhone; // 사업장 전화번호
	private String rcptCompanyBPhone1;// 사업장 전화번호 1
	private String rcptCompanyBPhone2;// 사업장 전화번호 2
	private String rcptCompanyBPhone3;// 사업장 전화번호 3
	private String rcptPmName;        // 담당자 이름
	private String rcptPmDept;        // 담당자 부서
	private String rcptPmPosition;    // 담당자 직책
	private String rcptPmPhone1;      // 담당자 전화번호 1
	private String rcptPmPhone2;      // 담당자 전화번호 2
	private String rcptPmPhone3;      // 담당자 전화번호 3
	private String rcptPmMobile1;     // 담당자 휴대폰 번호 1
	private String rcptPmMobile2;     // 담당자 휴대폰 번호 2
	private String rcptPmMobile3;     // 담당자 휴대폰 번호 3
	private String rcptPmEmail;       // 담당자 이메일 주소
	
	// 기술 명칭 - 리스트 출력 용
	private String techName; 		// 기술 분야 
	private String techItemName;    // 기술 범위   TECH_NCT_CODE
	private String techNtcGid; 		// 기술 분야
	private String techNctCode; 		// 기술 분야 
	private String techUniqId;    // 기술 범위  
	private String techRcptTechNm;  // 기술 명칭 (접수시 입력된 기술 명칭)
	
	
	// 리스트 페이징 변수 
	private int pageNo;
	private int startNo;
	private int pageRows;
	private int totalPage;
	private int totalRows;
	
	public void setPageInit() {
		pageNo = 1;
		pageRows = 10;
	}
}

