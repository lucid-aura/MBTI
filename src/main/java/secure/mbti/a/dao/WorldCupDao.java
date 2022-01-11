package secure.mbti.a.dao;

import java.util.List;

import secure.mbti.a.dto.WorldCupDto;

public interface WorldCupDao {

	List<WorldCupDto> worldcuplist(String param);

	WorldCupDto worldcupresult(int worldcupseq);

}
