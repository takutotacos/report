class Actual < ActiveRecord::Base
  belongs_to :report

  attr_accessor :array_start_time, :array_end_time

  # タスクの開始時刻と終了時刻をもとに工数を計算する。
    def set_time_spent(start, finish)
      start_hour = start[0,2].to_f
      start_min = start[3,2].to_f
      finish_hour = finish[0,2].to_f
      finish_min = finish[3,2].to_f
      # 終了時刻から開始時刻を引く（時間・分を別々に行う）
      ans_hour = finish_hour - start_hour
    	ans_min = finish_min - start_min
  		if finish_min < start_min then
  			ans_min += 60.0
  			ans_hour -= 1.0
      end
    		# 作業時間が、7分未満なら切り捨て、8分~22分なら0.25時間、23分~37分なら0.5時間、38分~52分なら0.75時間、それ以上は1時間とする。
    	if ans_min <= 7.0 then
        ans_min = 0.0
  		elsif 8.0 <= ans_min && ans_min <= 22.0 then
    	  ans_min = 0.25
    	elsif 23.0 <= ans_min && ans_min <= 37.0 then
    		ans_min = 0.5
    	elsif 38.0 <= ans_min && ans_min <= 52.0 then
  		  ans_min = 0.75
    	else
    		ans_min = 0.0
    		ans_hour += 1.0
    	end
  		return ans_hour + ans_min
    end
end
