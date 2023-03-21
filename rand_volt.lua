function init()
    input[1].mode('change', 1.0, 0.1, 'rising')
end

input[1].change = function(state)
    new_volt = math.random() * 10
    output[1].volts = new_volt
    print('setting output[1] to ' .. new_volt)
end
