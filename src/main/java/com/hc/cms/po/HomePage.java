package com.hc.cms.po;

public class HomePage {
	private Banner bigBanner1;
	private Banner bigBanner2;
	private Banner bigBanner3;

	public Banner getBigBanner1() {
		return bigBanner1;
	}
	public void setBigBanner1(Banner bigBanner1) {
		this.bigBanner1 = bigBanner1;
	}
	public Banner getBigBanner2() {
		return bigBanner2;
	}
	public void setBigBanner2(Banner bigBanner2) {
		this.bigBanner2 = bigBanner2;
	}
	public Banner getBigBanner3() {
		return bigBanner3;
	}
	public void setBigBanner3(Banner bigBanner3) {
		this.bigBanner3 = bigBanner3;
	}
	@Override
	public String toString() {
		return "HomePage [bigBanner1=" + bigBanner1 + ", bigBanner2=" + bigBanner2 + ", bigBanner3=" + bigBanner3 + "]";
	}
	
}
