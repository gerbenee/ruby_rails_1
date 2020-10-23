module GreeterHelper
    def formatted_time(time)
        #time to AM/PM
        time.strftime("%I:%M%p")
    end
end
