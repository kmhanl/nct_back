package kaits.nct.member.model;

import java.util.List;

import lombok.Data;

@Data
public class MemberSaveDTO {
	private MemberVO admInfo;
	private List<MemberAuthorityVO> techList;
}
