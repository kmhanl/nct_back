package kaits.nct.expert.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("expertCommitteeMemberVO")
public class ExpertCommitteeMemberVO {
	private String committeeIdx;
	private String committeeTechId;
	private String admId;
	private String committeeOptCom;
	private String committeeOptYn;
	private String committeeSignViewYn; // 연식 추가 비밀 유지 동의 여부 (자료 열람)
	private String committeeSignView; // 연식 추가 비밀 유지 동의 서명 (자료 열람)
	private String committeeSignWriteYn; // 연식 추가 비밀 유지 동의 여부 (의견제출 진입)
	private String committeeSignWrite; // 연식 추가 비밀 유지 동의 서명 (의견제출 진입)
	private String committeeSignSaveYn; // 연식 추가 비밀 유지 동의 여부 (최종의견제출)
	private String committeeSignSave; // 연식 추가 비밀 유지 동의 서명 (최종의견제출)
	private String committeeDatePick;
	private String committeeDatePick1;
	private String committeeDatePick2;
	private String committeeDatePick3;
	private String committeeDatePick4;
	private String committeeDatePickEtc;
	private String committeeDatePickEtcDispKo;
	private String admGroup;
	private String admCarYear;
	private String admCarNum;
	private String admName;
	private String admDept;
	private String admPositon;
	private String admCom;
	private String admMobile;
	private String admMobile1;
	private String admMobile2;
	private String admMobile3;
	private String admEmail;
	public void setCommitteeDatePickEtc(String committeeDatePickEtc) {
		this.committeeDatePickEtc = committeeDatePickEtc;
		if (committeeDatePickEtc != null) {
			this.committeeDatePickEtcDispKo = committeeDatePickEtc.substring(0, 4) + "년 "
					+ committeeDatePickEtc.substring(4, 6) + "월 "
					+ committeeDatePickEtc.substring(6, 8) + "일 "
					+ committeeDatePickEtc.substring(8, 10) + ":"
					+ committeeDatePickEtc.substring(10, 12);
		}
	}
}
