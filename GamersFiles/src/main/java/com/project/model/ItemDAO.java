package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class ItemDAO {

	// 세션 생성해 줄 Factory 생성
			SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

			// connection, close, ... sql문 실행
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			public List<ItemDTO> ItemName(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			
			public List<ItemDTO> ItemName2(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName2");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel2(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel2");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel2(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel2");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation2(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation2");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			
			public List<ItemDTO> ItemName3(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName3");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel3(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel3");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel3(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel3");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation3(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation3");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			
			public List<ItemDTO> ItemName4(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName4");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel4(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel4");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel4(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel4");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation4(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation4");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			
			public List<ItemDTO> ItemName5(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName5");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel5(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel5");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel5(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel5");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation5(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation5");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			
			public List<ItemDTO> ItemName6(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName6");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel6(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel6");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel6(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel6");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation6(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation6");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			
			public List<ItemDTO> ItemName7(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName7");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel7(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel7");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel7(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel7");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation7(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation7");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			
			public List<ItemDTO> ItemName8(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName8");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel8(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel8");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel8(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel8");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation8(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation8");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			
			public List<ItemDTO> ItemName9(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName9");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel9(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel9");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel9(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel9");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation9(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation9");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			public List<ItemDTO> ItemName10(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName10");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel10(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel10");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel10(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel10");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation10(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation10");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			public List<ItemDTO> ItemName11(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName11");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel11(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel11");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel11(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel11");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation11(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation11");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			public List<ItemDTO> ItemName12(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName12");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel12(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel12");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel12(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel12");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation12(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation12");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			public List<ItemDTO> ItemName13(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName13");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel13(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel13");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel13(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel13");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation13(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation13");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			public List<ItemDTO> ItemName14(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName14");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel14(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel14");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel14(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel14");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation14(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation14");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
			public List<ItemDTO> ItemName15(String i_name){
				List<ItemDTO> i_names = null;
				try {
					i_names = sqlSession.selectList("com.project.database.ItemMapper.ItemName15");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_names;
			}
			
			public List<ItemDTO> ItemLevel15(String i_level){
				List<ItemDTO> i_levels = null;
				try {
					i_levels = sqlSession.selectList("com.project.database.ItemMapper.ItemLevel15");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return i_levels;
			}
			
			public List<ItemDTO> EquipLevel15(String e_level){
				List<ItemDTO> e_levels = null;
				try {
					e_levels = sqlSession.selectList("com.project.database.ItemMapper.EquipLevel15");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return e_levels;
			}
			
			public List<ItemDTO> DropLocation15(String d_location){
				List<ItemDTO> d_locations = null;
				try {
					d_locations = sqlSession.selectList("com.project.database.ItemMapper.DropLocation15");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return d_locations;
			}
}
