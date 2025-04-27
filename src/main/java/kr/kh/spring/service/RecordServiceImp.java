package kr.kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.dao.RecordDAO;
import kr.kh.spring.model.dto.RecordDTO;
import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.Diet_PicVO;
import kr.kh.spring.model.vo.InbodyVO;
import kr.kh.spring.model.vo.Inbody_PicVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.WorkoutVO;
import kr.kh.spring.model.vo.Workout_PicVO;
import kr.kh.spring.utils.UploadFileUtils;

@Service
@PropertySource("classpath:config.properties")
public class RecordServiceImp implements RecordService {

	@Autowired
	RecordDAO recordDAO;

	@Value("${file.location}")
	String uploadPath;

	@Override
	public List<DietVO> selectDietList(String me_id) {
		return recordDAO.selectDietList(me_id);
	}

	public boolean insertDietPost(DietVO diet, MemberVO user, MultipartFile file) {
		if (diet == null || diet.getDi_name() == null || diet.getDi_date() == null || diet.getDi_ampm() == null
				|| diet.getDi_time() == null || diet.getDi_score() == 0) {
			return false;
		}
		if (user == null || user.getMe_id() == null) {
			return false;
		}
		diet.setDi_me_id(user.getMe_id());

		boolean res = recordDAO.insertDietPost(diet);
		System.out.println(res);

		if (!res) {
			return false;
		}
		System.out.println(diet);
		int di_num = diet.getDi_num();

		if (file != null) {
			insertFile(di_num, file);
		}

		return true;
	}

	private void insertFile(int di_num, MultipartFile file) {
		if (file == null) {
			return;
		}

		String dp_ori_name = file.getOriginalFilename();

		if (dp_ori_name == null || dp_ori_name.length() == 0) {
			return;
		}

		int index = dp_ori_name.lastIndexOf(".");
		String suffix = dp_ori_name.substring(index);

		try {
			String dp_name = UploadFileUtils.uploadFile(uploadPath, "" + di_num, suffix, file.getBytes());

			Diet_PicVO diet_PicVO = new Diet_PicVO(dp_ori_name, dp_name, di_num);

			recordDAO.insertFile(diet_PicVO);
		} catch (Exception e) {

			e.printStackTrace();
		}
		System.out.println("uploadPath = " + uploadPath);
	}

	@Override
	public List<InbodyVO> selectInbodyList(String me_id) {
		return recordDAO.selectInbodyList(me_id);
	}

	@Override
	public List<WorkoutVO> selectWorkoutList(String me_id) {
		return recordDAO.selectWorkoutList(me_id);
	}

	@Override
	public List<RecordDTO> getAllRecords(String date) {
		return recordDAO.selectAllRecordsList();
	}

	@Override
	public boolean insertInbodyPost(InbodyVO inbody, MemberVO user, MultipartFile file) {
		if (inbody == null || inbody.getIb_date() == null || inbody.getIb_weight() == 0) {
			return false;
		}
		if (user == null || user.getMe_id() == null) {
			return false;
		}
		inbody.setIb_me_id(user.getMe_id());

		boolean res = recordDAO.insertInbodyPost(inbody);
		if (!res) {
			return false;
		}
		int ib_num = inbody.getIb_num();

		if (file != null && !file.getOriginalFilename().isEmpty()) {
			insertInbodyFile(ib_num, file);
		}

		return true;
	}

	private void insertInbodyFile(int ib_num, MultipartFile file) {
		if (file == null) {
			return;
		}

		String ip_ori_name = file.getOriginalFilename();

		if (ip_ori_name.length() == 0) {
			return;
		}

		int index = ip_ori_name.lastIndexOf(".");
		String suffix = ip_ori_name.substring(index);

		try {
			String ip_name = UploadFileUtils.uploadFile(uploadPath, "" + ib_num, suffix, file.getBytes());

			Inbody_PicVO inbody_PicVO = new Inbody_PicVO(ip_ori_name, ip_name, ib_num);

			recordDAO.insertInbodyFile(inbody_PicVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("uploadPath = " + uploadPath);
	}

	@Override
	public boolean insertWorkoutPost(WorkoutVO workout, MemberVO user, MultipartFile file) {
		if (user == null || user.getMe_id() == null) {
			return false;
		}
		workout.setWo_me_id(user.getMe_id());

		// 첨부파일
		if (file == null || file.getOriginalFilename().length() == 0) {
			return false;
		}

		boolean res = recordDAO.insertWorkoutPost(workout);

		if (!res || workout.getWo_num() == 0) {
			return false;
		}
		int wo_num = workout.getWo_num();

		if (file != null && !file.getOriginalFilename().isEmpty()) {
			insertWorkoutFile(wo_num, file);
		}

		return true;
	}

	private void insertWorkoutFile(int wo_num, MultipartFile file) {
		if (file == null) {
			return;
		}

		String wp_ori_name = file.getOriginalFilename();

		if (wp_ori_name.length() == 0) {
			return;
		}

		int index = wp_ori_name.lastIndexOf(".");
		String suffix = wp_ori_name.substring(index);

		try {
			String wp_name = UploadFileUtils.uploadFile(uploadPath, "" + wo_num, suffix, file.getBytes());

			Workout_PicVO workout_PicVO = new Workout_PicVO(wp_ori_name, wp_name, wo_num);

			recordDAO.insertWorkoutFile(workout_PicVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("uploadPath = " + uploadPath);

	}

}
