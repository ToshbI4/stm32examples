function(hex2dec DEC HEX)
    string(TOUPPER "${HEX}" HEX)
    set(RES 0)
    string(LENGTH "${HEX}" STRING_LENGTH)

    while(STRING_LENGTH GREATER 0)
        math(EXPR RES "${RES} * 16")
        string(SUBSTRING "${HEX}" 0 1 NIBBLE)
        string(SUBSTRING "${HEX}" 1 -1 HEX)
        if(NIBBLE STREQUAL "A")
            math(EXPR RES "${RES} + 10")
        elseif(NIBBLE STREQUAL "B")
            math(EXPR RES "${RES} + 11")
        elseif(NIBBLE STREQUAL "C")
            math(EXPR RES "${RES} + 12")
        elseif(NIBBLE STREQUAL "D")
            math(EXPR RES "${RES} + 13")
        elseif(NIBBLE STREQUAL "E")
            math(EXPR RES "${RES} + 14")
        elseif(NIBBLE STREQUAL "F")
            math(EXPR RES "${RES} + 15")
        else()
            math(EXPR RES "${RES} + ${NIBBLE}")
        endif()

        string(LENGTH "${HEX}" STRING_LENGTH)
    endwhile()

    set(${DEC} ${RES} PARENT_SCOPE)
endfunction()
