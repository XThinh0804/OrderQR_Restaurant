package com.myproject.javaweb_restaurant.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.javaweb_restaurant.dto.RestaurantContant;
import com.myproject.javaweb_restaurant.model.Food;



@Service
public class FoodService extends BaseService<Food> implements RestaurantContant {

	@Override
	public Class<Food> clazz() {
		return Food.class;
	}
	public List<Food> findAllActive(){
		String sql = "SELECT*FROM tbl_food WHERE status=1";
		return super.executeNativeSql(sql);
	}
	public boolean isUploadedFile(MultipartFile file) {
		if ((file != null) && (!file.getOriginalFilename().isEmpty())) {
			return true;
		}
		return false;
	}

	@Transactional
	public void saveFood(Food food, MultipartFile imageFile) throws IOException {
		if (isUploadedFile(imageFile)) {
			String path = FOLDER_UPLOAD + "Food/Image/" + imageFile.getOriginalFilename();
			File file = new File(path);
			imageFile.transferTo(file);
			food.setImage("Food/Image/" + imageFile.getOriginalFilename());
		}
		super.saveOrUpdate(food);
	}
	@Transactional
	public void saveEditFood(Food food, MultipartFile imageFile)
	throws IOException{
		Food dbFood = super.getById(food.getId());
		if(isUploadedFile(imageFile)) {
			String path = FOLDER_UPLOAD + dbFood.getImage();
			File file = new File(path);
			file.delete();
			path = FOLDER_UPLOAD + "Food/Image/"+ imageFile.getOriginalFilename();
			file = new File(path);
			imageFile.transferTo(file);
			food.setImage("Food/Image/"+imageFile.getOriginalFilename());
		}
		else {
			food.setImage(dbFood.getImage());
		}
		super.saveOrUpdate(food);
	}
}
