package kaits.nct.expert.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("expertCommitteeVO")
public class ExpertCommitteeVO {
	private String committeeIdx;
	private String committeeTechId;
	private String committeeTechName;
	private String committeeYear;
	private String committeeNum;
	private String memInYn;
	private String committeeTechNum;
	private int committeeAgdCnt;
	private int committeeAmg03Cnt;
	private int committeeAmg04Cnt;
	private int committeeAmg05Cnt;
	private int committeeAmg06Cnt;
	private String committeeType;
	private String committeeDatePickS;
	private String committeeDatePickSD;
	private String committeeDatePickSDF;
	private String committeeDatePickSH;
	private String committeeDatePickSM;
	private String committeeDatePickSDisp;
	private String committeeDatePickSDispKo;
	private String committeeDatePickE;
	private String committeeDatePickED;
	private String committeeDatePickEDF;
	private String committeeDatePickEH;
	private String committeeDatePickEM;
	private String committeeDatePickEDisp;
	private String committeeDatePickEDispKo;
	private String dateCheckYn;
	private String dateCheckStrYn;
	private String dateCheckEndYn;
	private String committeeOptCom;
	private String committeeOptYn;
	private String committeeSignViewYn;
	private String committeeSignView;
	private String committeeSignWriteYn;
	private String committeeSignWrite;
	private String committeeSignSaveYn;
	private String committeeSignSave;
	private String committeeDatePick1;
	private String committeeDatePick1Disp;
	private String committeeDatePick1DispKo;
	private String committeeDatePick1D;
	private String committeeDatePick1DF;
	private String committeeDatePick1DFKo;
	private String committeeDatePick1H;
	private String committeeDatePick1M;
	private String committeeDateAdd1;
	private String committeeDatePick2;
	private String committeeDatePick2Disp;
	private String committeeDatePick2DispKo;
	private String committeeDatePick2D;
	private String committeeDatePick2DF;
	private String committeeDatePick2DFKo;
	private String committeeDatePick2H;
	private String committeeDatePick2M;
	private String committeeDateAdd2;
	private String committeeDatePick3;
	private String committeeDatePick3Disp;
	private String committeeDatePick3DispKo;
	private String committeeDatePick3D;
	private String committeeDatePick3DF;
	private String committeeDatePick3DFKo;
	private String committeeDatePick3H;
	private String committeeDatePick3M;
	private String committeeDateAdd3;
	private String committeeDatePick;
	private String committeeDatePickDisp;
	private String committeeDatePickD;
	private String committeeDatePickDF;
	private String committeeDatePickDFKo;
	private String committeeDatePickDispKo;
	private String committeeDatePickH;
	private String committeeDatePickM;
	private String committeeDateAdd;
	private String committeeModiS;
	private String committeeModiSD;
	private String committeeModiSDF;
	private String committeeModiSH;
	private String committeeModiSM;
	private String committeeModiE;
	private String committeeModiED;
	private String committeeModiEDF;
	private String committeeModiEH;
	private String committeeModiEM;
	private String committeeModiSDisp;
	private String committeeModiEDisp;
	private String committeeConfirmYn;
	private String committeeStatus;
	private String committeeStatusName;
	private String lastUpdt;
	private String lastUpdtDisp;
	private String lastUpdusrId;
	private int agdCnt;
	private int committeeMemberCnt;
	private int committeeOpinionYCnt;
	private int committeeOpinionNCnt;
	private String committeeDatePickMember;
	
	private String admGroup;
	private String admId;
	
	private boolean isDatepick;
	private boolean isOpen;
	
	private int pageNo;
	private int startNo;
	private int pageRows;
	private int totalPage;
	private int totalRows; 
	
	public void setPageInit() {
		pageNo = 1;
		pageRows = 10;
	}
	
	public void setCommitteeDatePickS(String committeeDatePickS) {
		this.committeeDatePickS = committeeDatePickS;
		if (committeeDatePickS != null) {
			this.committeeDatePickSD = committeeDatePickS.substring(0, 8);
			this.committeeDatePickSDF = committeeDatePickS.substring(0, 4) + "-" + committeeDatePickS.substring(4, 6) + "-" + committeeDatePickS.substring(6, 8);
			this.committeeDatePickSH = committeeDatePickS.substring(8, 10);
			this.committeeDatePickSM = committeeDatePickS.substring(10, 12);
			this.committeeDatePickSDisp = this.committeeDatePickSDF + " " + this.committeeDatePickSH  + ":" + this.committeeDatePickSM;
			this.committeeDatePickSDispKo = committeeDatePickS.substring(0, 4) + "년 "
					+ committeeDatePickS.substring(4, 6) + "월 "
					+ committeeDatePickS.substring(6, 8) + "일 "
					+ this.committeeDatePickSH  + ":" + this.committeeDatePickSM;
		}
	}
	public void setCommitteeDatePickE(String committeeDatePickE) {
		this.committeeDatePickE = committeeDatePickE;
		if (committeeDatePickE != null) {
			this.committeeDatePickED = committeeDatePickE.substring(0, 8);
			this.committeeDatePickEDF = committeeDatePickE.substring(0, 4) + "-" + committeeDatePickE.substring(4, 6) + "-" + committeeDatePickE.substring(6, 8);
			this.committeeDatePickEH = committeeDatePickE.substring(8, 10);
			this.committeeDatePickEM = committeeDatePickE.substring(10, 12);
			this.committeeDatePickEDisp = this.committeeDatePickEDF + " " + this.committeeDatePickEH  + ":" + this.committeeDatePickEM;
			this.committeeDatePickEDispKo = committeeDatePickE.substring(0, 4) + "년 "
					+ committeeDatePickE.substring(4, 6) + "월 "
					+ committeeDatePickE.substring(6, 8) + "일 "
					+ this.committeeDatePickEH  + ":" + this.committeeDatePickEM;
		}
	}
	public void setCommitteeDatePick1(String committeeDatePick1) {
		this.committeeDatePick1 = committeeDatePick1;
		if (committeeDatePick1 != null) {
			this.committeeDatePick1D = committeeDatePick1.substring(0, 8);
			this.committeeDatePick1DF = committeeDatePick1.substring(0, 4) + "-" + committeeDatePick1.substring(4, 6) + "-" + committeeDatePick1.substring(6, 8);
			this.committeeDatePick1DFKo = committeeDatePick1.substring(0, 4) + "년 " + committeeDatePick1.substring(4, 6) + "월 " + committeeDatePick1.substring(6, 8) + "일";
			this.committeeDatePick1H = committeeDatePick1.substring(8, 10);
			this.committeeDatePick1M = committeeDatePick1.substring(10, 12);
			this.committeeDatePick1Disp = this.committeeDatePick1DF + " " + this.committeeDatePick1H  + ":" + this.committeeDatePick1M;
			this.committeeDatePick1DispKo = committeeDatePick1.substring(0, 4) + "년 "
					+ committeeDatePick1.substring(4, 6) + "월 "
					+ committeeDatePick1.substring(6, 8) + "일 "
					+ this.committeeDatePick1H  + ":" + this.committeeDatePick1M;
		}
	}
	public void setCommitteeDatePick2(String committeeDatePick2) {
		this.committeeDatePick2 = committeeDatePick2;
		if (committeeDatePick2 != null) {
			this.committeeDatePick2D = committeeDatePick2.substring(0, 8);
			this.committeeDatePick2DF = committeeDatePick2.substring(0, 4) + "-" + committeeDatePick2.substring(4, 6) + "-" + committeeDatePick2.substring(6, 8);
			this.committeeDatePick2DFKo = committeeDatePick2.substring(0, 4) + "년 " + committeeDatePick2.substring(4, 6) + "월 " + committeeDatePick2.substring(6, 8) + "일";
			this.committeeDatePick2H = committeeDatePick2.substring(8, 10);
			this.committeeDatePick2M = committeeDatePick2.substring(10, 12);
			this.committeeDatePick2Disp = this.committeeDatePick2DF + " " + this.committeeDatePick2H  + ":" + this.committeeDatePick2M;
			this.committeeDatePick2DispKo = committeeDatePick2.substring(0, 4) + "년 "
					+ committeeDatePick2.substring(4, 6) + "월 "
					+ committeeDatePick2.substring(6, 8) + "일 "
					+ this.committeeDatePick2H  + ":" + this.committeeDatePick2M;
		}
	}
	public void setCommitteeDatePick3(String committeeDatePick3) {
		this.committeeDatePick3 = committeeDatePick3;
		if (committeeDatePick3 != null) {
			this.committeeDatePick3D = committeeDatePick3.substring(0, 8);
			this.committeeDatePick3DF = committeeDatePick3.substring(0, 4) + "-" + committeeDatePick3.substring(4, 6) + "-" + committeeDatePick3.substring(6, 8);
			this.committeeDatePick3DFKo = committeeDatePick3.substring(0, 4) + "년 " + committeeDatePick3.substring(4, 6) + "월 " + committeeDatePick3.substring(6, 8) + "일";
			this.committeeDatePick3H = committeeDatePick3.substring(8, 10);
			this.committeeDatePick3M = committeeDatePick3.substring(10, 12);
			this.committeeDatePick3Disp = this.committeeDatePick3DF + " " + this.committeeDatePick3H  + ":" + this.committeeDatePick3M;
			this.committeeDatePick3DispKo = committeeDatePick3.substring(0, 4) + "년 "
					+ committeeDatePick3.substring(4, 6) + "월 "
					+ committeeDatePick3.substring(6, 8) + "일 "
					+ this.committeeDatePick3H  + ":" + this.committeeDatePick3M;
		}
	}
	public void setCommitteeDatePick(String committeeDatePick) {
		this.committeeDatePick = committeeDatePick;
		if (committeeDatePick != null) {
			switch (this.committeeDatePick) {
			case "1":
				if (committeeDatePick1 == null) return;
				this.committeeDatePickD = committeeDatePick1.substring(0, 8);
				this.committeeDatePickDF = committeeDatePick1.substring(0, 4) + "-"
						+ committeeDatePick1.substring(4, 6) + "-"
						+ committeeDatePick1.substring(6, 8);
				this.committeeDatePickH = committeeDatePick1.substring(8, 10);
				this.committeeDatePickM = committeeDatePick1.substring(10, 12);
				this.committeeDatePickDisp = this.committeeDatePickDF + " " + this.committeeDatePickH  + ":" + this.committeeDatePickM;
				this.committeeDatePickDFKo = committeeDatePick1DFKo;
				this.committeeDatePickDispKo = committeeDatePick1DispKo;
				this.committeeDateAdd = this.committeeDateAdd1;
				break;
			case "2":
				if (committeeDatePick2 == null) return;
				this.committeeDatePickD = committeeDatePick2.substring(0, 8);
				this.committeeDatePickDF = committeeDatePick2.substring(0, 4) + "-"
						+ committeeDatePick2.substring(4, 6) + "-"
						+ committeeDatePick2.substring(6, 8);
				this.committeeDatePickH = committeeDatePick2.substring(8, 10);
				this.committeeDatePickM = committeeDatePick2.substring(10, 12);
				this.committeeDatePickDisp = this.committeeDatePickDF + " " + this.committeeDatePickH  + ":" + this.committeeDatePickM;
				this.committeeDatePickDFKo = committeeDatePick2DFKo;
				this.committeeDatePickDispKo = committeeDatePick2DispKo;
				this.committeeDateAdd = this.committeeDateAdd2;
				break;
			case "3":
				if (committeeDatePick3 == null) return;
				this.committeeDatePickD = committeeDatePick3.substring(0, 8);
				this.committeeDatePickDF = committeeDatePick3.substring(0, 4) + "-"
						+ committeeDatePick3.substring(4, 6) + "-"
						+ committeeDatePick3.substring(6, 8);
				this.committeeDatePickH = committeeDatePick3.substring(8, 10);
				this.committeeDatePickM = committeeDatePick3.substring(10, 12);
				this.committeeDatePickDisp = this.committeeDatePickDF + " " + this.committeeDatePickH  + ":" + this.committeeDatePickM;
				this.committeeDatePickDFKo = committeeDatePick3DFKo;
				this.committeeDatePickDispKo = committeeDatePick3DispKo;
				this.committeeDateAdd = this.committeeDateAdd3;
				break;
			}
			DateFormat d = new SimpleDateFormat("yyyyMMdd");
			String datestr = d.format(Calendar.getInstance().getTime());

			if (Long.parseLong(this.committeeDatePickD) != Long.parseLong(datestr)) {
				this.isOpen = false;
			} else {
				this.isOpen = true;
			}
		}
	}
	public void setCommitteeModiS(String committeeModiS) {
		this.committeeModiS = committeeModiS;
		if (committeeModiS != null) {
			this.committeeModiSD = committeeModiS.substring(0, 8);
			this.committeeModiSDF = committeeModiS.substring(0, 4) + "-" + committeeModiS.substring(4, 6) + "-" + committeeModiS.substring(6, 8);
			this.committeeModiSH = committeeModiS.substring(8, 10);
			this.committeeModiSM = committeeModiS.substring(10, 12);
			this.committeeModiSDisp = this.committeeModiSDF + " " + this.committeeModiSH  + ":" + this.committeeModiSM;
//			
		}
	}
	public void setCommitteeModiE(String committeeModiE) {
		this.committeeModiE = committeeModiE;
		if (committeeModiE != null) {
			this.committeeModiED = committeeModiE.substring(0, 8);
			this.committeeModiEDF = committeeModiE.substring(0, 4) + "-" + committeeModiE.substring(4, 6) + "-" + committeeModiE.substring(6, 8);
			this.committeeModiEH = committeeModiE.substring(8, 10);
			this.committeeModiEM = committeeModiE.substring(10, 12);
			this.committeeModiEDisp = this.committeeModiEDF + " " + this.committeeModiEH  + ":" + this.committeeModiEM;
		}
	}
}
