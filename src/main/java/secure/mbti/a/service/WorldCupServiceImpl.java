package secure.mbti.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import secure.mbti.a.dao.WorldCupDao;
import secure.mbti.a.dto.WorldCupDto;

@Service
public class WorldCupServiceImpl implements WorldCupService {

	@Autowired
	WorldCupDao dao;
	
	@Override
	public List<WorldCupDto> worldcuplist(String topic) {
		return dao.worldcuplist(topic);
	}

}
