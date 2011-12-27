class Add2015Holidays < ActiveRecord::Migration
  def self.up
    holidays = [ 
      { :name => "元旦",         :holiday_at => "2015/1/1"   },  
      { :name => "成人の日",     :holiday_at => "2015/1/12"  },  
      { :name => "建国記念日",   :holiday_at => "2015/2/11"  },  
      { :name => "春分の日",     :holiday_at => "2015/3/21"  },  
      { :name => "昭和の日",     :holiday_at => "2015/4/29"  },  
      { :name => "憲法記念日",   :holiday_at => "2015/5/3"   },  
      { :name => "みどりの日",   :holiday_at => "2015/5/4"   },  
      { :name => "こどもの日",   :holiday_at => "2015/5/5"   },  
      { :name => "振替休日",     :holiday_at => "2015/5/6"   },  
      { :name => "海の日",       :holiday_at => "2015/7/20"  },  
      { :name => "敬老の日",     :holiday_at => "2015/9/21"  },  
      { :name => "国民の休日",   :holiday_at => "2015/9/22"  },  
      { :name => "秋分の日",     :holiday_at => "2015/9/23"  },  
      { :name => "体育の日",     :holiday_at => "2015/10/12" },  
      { :name => "文化の日",     :holiday_at => "2015/11/03" },
      { :name => "勤労感謝の日", :holiday_at => "2015/11/23" },
      { :name => "天皇誕生日",   :holiday_at => "2015/12/23" }
    ]   

    holidays.each do |holiday|
      Holiday.create holiday
    end 
  end

  def self.down
  end
end
