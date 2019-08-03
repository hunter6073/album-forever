package com.tedu.classes;

public class index_menu_album {
	    public String albumid;
	    public String name;
		public String singer;
		public String img;
		public String background;
		public int sold;
		public index_menu_album(){}
		public index_menu_album(String albumid,String name, String singer, String img,
				String background) {
			super();
			this.albumid = albumid;
			this.name = name;
			this.singer = singer;
			this.img = img;
			this.background = background;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getSinger() {
			return singer;
		}
		public void setSinger(String singer) {
			this.singer = singer;
		}
		public String getImg() {
			return img;
		}
		public void setImg(String img) {
			this.img = img;
		}
		public String getBackground() {
			return background;
		}
		public void setBackground(String background) {
			this.background = background;
		}
		public String getAlbumid() {
			return albumid;
		}
		public void setAlbumid(String albumid) {
			this.albumid = albumid;
		}
		public int getSold() {
			return sold;
		}
		public void setSold(int sold) {
			this.sold = sold;
		}
		
		
		
}
