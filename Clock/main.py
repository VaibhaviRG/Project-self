from tkinter import *
import datetime

def date_time():
    time = datetime.datetime.now()
    hr = time.strftime('%I')  #%I gives hour, strftime gives in 24 hours
    mi = time.strftime('%M')  #%M gives min
    sec = time.strftime('%S')
    am = time.strftime('%p')
    date = time.strftime('%d')
    month = time.strftime('%m')
    year = time.strftime('%y')
    day = time.strftime('%a')

    lab_hr.config(text =hr)
    lab_min.config(text=mi)
    lab_sec.config(text=sec)
    lab_am.config(text=am)
    lab_date.config(text=date)
    lab_mo.config(text=month)
    lab_year.config(text=year)
    lab_day.config(text=day)

    lab_hr.after(200,date_time) #after function changes the data i.e the text after 200 ms by date_time function


clock = Tk() #class call
clock.title('     ****Digital Clock****') #for titile
clock.geometry('1000x500') #to open the window of particular size
clock.config(bg='#53868B') #background color


#***** Time


lab_hr=Label(clock,text='00',font=("Time New Roman",60,"bold"),bg='#171717',fg="#FFFAF0")
#box for hour using Label function defined in class clock,
# text shown in that box
#font style and size
#font color =fg
lab_hr.place(x=120,y=50,height=110,width=100)
# placement of the label, x and y-axis away from the main window, 40 away from up and down
#height and width of the box

#block with Hour label
lab_hr_txt=Label(clock,text='Hour',font=("Time New Roman",20,"bold"),bg='#171717',fg="#FFFAF0")
lab_hr_txt.place(x=120,y=190,height=40,width=100)

#block for min
lab_min=Label(clock,text='00',font=("Time New Roman",60,"bold"),bg='#171717',fg="#FFFAF0")
lab_min.place(x=340,y=50,height=110,width=100)
#block with Min. label
lab_min_txt=Label(clock,text='Min.',font=("Time New Roman",20,"bold"),bg='#171717',fg="#FFFAF0")
lab_min_txt.place(x=340,y=190,height=40,width=100)
#block for sec
lab_sec=Label(clock,text='00',font=("Time New Roman",60,"bold"),bg='#171717',fg="#FFFAF0")
lab_sec.place(x=560,y=50,height=110,width=100)
#block with Sec. label
lab_sec_txt=Label(clock,text='Sec.',font=("Time New Roman",20,"bold"),bg='#171717',fg="#FFFAF0")
lab_sec_txt.place(x=560,y=190,height=40,width=100)
#block for AM
lab_am=Label(clock,text='00',font=("Time New Roman",50,"bold"),bg='#171717',fg="#FFFAF0")
lab_am.place(x=780,y=50,height=110,width=100)
#block with AM/PM. label
lab_am_txt=Label(clock,text='AM/PM',font=("Time New Roman",20,"bold"),bg='#171717',fg="#FFFAF0")
lab_am_txt.place(x=780,y=190,height=40,width=100)

# ***** Date

lab_date=Label(clock,text='00',font=("Time New Roman",60,"bold"),bg='#171717',fg="#FFFAF0")
lab_date.place(x=120,y=270,height=110,width=100)
lab_date_txt=Label(clock,text='Date',font=("Time New Roman",20,"bold"),bg='#171717',fg="#FFFAF0")
lab_date_txt.place(x=120,y=410,height=40,width=100)

lab_mo=Label(clock,text='00',font=("Time New Roman",60,"bold"),bg='#171717',fg="#FFFAF0")
lab_mo.place(x=340,y=270,height=110,width=100)
lab_mo_txt=Label(clock,text='Month',font=("Time New Roman",20,"bold"),bg='#171717',fg="#FFFAF0")
lab_mo_txt.place(x=340,y=410,height=40,width=100)

lab_year=Label(clock,text='00',font=("Time New Roman",60,"bold"),bg='#171717',fg="#FFFAF0")
lab_year.place(x=560,y=270,height=110,width=100)
lab_year_txt=Label(clock,text='Year',font=("Time New Roman",20,"bold"),bg='#171717',fg="#FFFAF0")
lab_year_txt.place(x=560,y=410,height=40,width=100)

lab_day=Label(clock,text='00',font=("Time New Roman",35,"bold"),bg='#171717',fg="#FFFAF0")
lab_day.place(x=780,y=270,height=110,width=100)
lab_day_txt=Label(clock,text='Day',font=("Time New Roman",20,"bold"),bg='#171717',fg="#FFFAF0")
lab_day_txt.place(x=780,y=410,height=40,width=100)




date_time() #call function
clock.mainloop() #turns on the graphics
