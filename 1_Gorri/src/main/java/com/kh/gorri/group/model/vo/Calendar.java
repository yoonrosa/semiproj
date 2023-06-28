package com.kh.gorri.group.model.vo;


public class Calendar {
   int schNo;
   String schedule;
   String calContent;
   int groupNo;
   String schDate;
   String calWriter;
   
   
   
   public Calendar(){}
   
   public Calendar(int schNo, String schedule, String calContent, int groupNo, String schDate, String calWriter) {
      super();
      this.schNo = schNo;
      this.schedule = schedule;
      this.calContent = calContent;
      this.groupNo = groupNo;
      this.schDate = schDate;
      this.calWriter = calWriter;
   }





   public int getSchNo() {
      return schNo;
   }





   public void setSchNo(int schNo) {
      this.schNo = schNo;
   }





   public String getSchedule() {
      return schedule;
   }





   public void setSchedule(String schedule) {
      this.schedule = schedule;
   }





   public String getCalContent() {
      return calContent;
   }





   public void setCalContent(String calContent) {
      this.calContent = calContent;
   }





   public int getGroupNo() {
      return groupNo;
   }





   public void setGroupNo(int groupNo) {
      this.groupNo = groupNo;
   }





   public String getSchDate() {
      return schDate;
   }





   public void setSchDate(String schDate) {
      this.schDate = schDate;
   }





   public String getCalWriter() {
      return calWriter;
   }





   public void setCalWriter(String calWriter) {
      this.calWriter = calWriter;
   }





   @Override
   public String toString() {
      return "Calendar [schNo=" + schNo + ", schedule=" + schedule + ", calContent=" + calContent + ", groupNo="
            + groupNo + ", schDate=" + schDate + ", calWriter=" + calWriter + "]";
   }
   
   
   
   
   
   
   
}