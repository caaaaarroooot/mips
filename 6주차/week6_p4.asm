.data                 # 데이터 섹션 시작
prompt: .asciiz "The maximum is: "  # 출력할 문자열
.text                 # 코드 섹션 시작

main:                 # 메인 함수 시작
    addi $a0, $zero, 5    # a = 5
    addi $a1, $zero, 6    # b = 2
    jal max                # max(5, 2) 호출

    # 종료
    li $v0, 10             # 서비스 번호 10: 종료
    syscall                # 종료

max:                  # max 함수 시작
    slt $t0, $a0, $a1      # $t0 = (b < a) ? 1 : 0
    beq $t0, $zero, else   # b >= a 이면 else로 분기
    move $v0, $a1          # a를 $v0에 저장 (a가 max)
    j end                   # end로 점프

else:                # else 레이블
    move $v0, $a0          # b를 $v0에 저장 (b가 max)

end:                 # 종료 레이블
    jr $ra                  # 호출한 위치로 돌아가기
