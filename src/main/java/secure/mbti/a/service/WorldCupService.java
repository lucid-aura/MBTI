package secure.mbti.a.service;

import java.util.List;

import secure.mbti.a.dto.WorldCupDto;

public interface WorldCupService {
	List<WorldCupDto> worldcuplist(String topic);

	WorldCupDto worldcupresult(int worldcupseq);
}
