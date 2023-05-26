package kaits.nct.member.model;

import java.util.List;

import lombok.Data;

@Data
public class MemberInvitationSaveDTO {
	private MemberInvitationVO memberInvitationInfo;
	private List<MemberAuthorityVO> techList;
}
