import re

def itob(num, length):
    if int(num) < 0:
        num = int((1 << length) + int(num))
    return format(int(num), f'0{length}b')

def assemble(asm_code):
    machine_code = []
    for line in asm_code.split('\n'):
        # I-TYPE INSTRUCTIONS
        if line.startswith('ADDI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(parts[3],15)}10000')
            continue

        if line.startswith('SUBI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(parts[3],15)}10001')
            continue

        if line.startswith('SLTI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(parts[3],15)}10010')
            continue
        
        if line.startswith('SGTI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(parts[3],15)}10011')
            continue
        
        if line.startswith('ANDI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(parts[3],15)}10100')
            continue
        
        if line.startswith('ORI'):
            parts = re.split('[ ,\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[4],4)}{itob(parts[2],4)}{itob(parts[5],15)}10101')
            continue
        
        if line.startswith('XORI'):
            parts = re.split('[ ,\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[4],4)}{itob(parts[2],4)}{itob(parts[5],15)}10110')
            continue
        
        if line.startswith('NOTI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[1],4)}{itob(0,4)}{itob(parts[3],15)}10111')
            continue
        
        if line.startswith('LUI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[1],4)}{itob(0,4)}{itob(parts[3],15)}11000')
            continue
        
        if line.startswith('NORI'):
            parts = re.split('[ ,\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[4],4)}{itob(parts[2],4)}{itob(parts[5],15)}11100')
            continue
    
        if line.startswith('SLLI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(parts[3],15)}11001')
            continue
    
        if line.startswith('SRLI'):
            parts = re.split('[ ,\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[4],4)}{itob(parts[2],4)}{itob(parts[5],15)}11010')
            continue
    
        if line.startswith('SRAI'):
            parts = re.split('[ ,\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[4],4)}{itob(parts[2],4)}{itob(parts[5],15)}11011')
            continue
            
        if line.startswith('LD'):
            parts = re.split('[ ,R\[\]\(\)]{1,}',line)
            print(parts)
            machine_code.append(f'0001{itob(parts[3],4)}{itob(parts[1],4)}{itob(parts[2],15)}00000')
            continue
    
        if line.startswith('ST'):
            parts = re.split('[ ,R\[\]\(\)]{1,}',line)
            print(parts)
            machine_code.append(f'0010{itob(parts[3],4)}{itob(parts[1],4)}{itob(parts[2],15)}00000')
            continue
        
        if line.startswith('BMI'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0011{itob(parts[1],4)}{itob(0,4)}{itob(parts[2],15)}00000')
            continue
            
        if line.startswith('BPL'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0100{itob(parts[1],4)}{itob(0,4)}{itob(parts[2],15)}00000')
            continue
            
        if line.startswith('BZ'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0101{itob(parts[1],4)}{itob(0,4)}{itob(parts[2],15)}00000')
            continue
    
        # R-TYPE INSTRUCTIONS

        if line.startswith('ADD'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}00000')
            continue
        
        if line.startswith('SUB'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}00001')
            continue
        
        if line.startswith('SLT'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}00010')
            continue
        
        if line.startswith('SGT'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}00011')
            continue
        
        if line.startswith('AND'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}00100')
            continue
        
        if line.startswith('OR'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}00101')
            continue
        
        if line.startswith('XOR'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}00110')
            continue

        if line.startswith('NOT'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(0,15)}00111')
            continue

        if line.startswith('SLL'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}01001')
            continue

        if line.startswith('SRL'):
            parts = re.split('[ ,\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[4],4)}{itob(parts[6],4)}{itob(parts[2],4)}{itob(0,11)}01010')
            continue
        
        if line.startswith('SRA'):
            parts = re.split('[ ,\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[4],4)}{itob(parts[6],4)}{itob(parts[2],4)}{itob(0,11)}01011')
            continue

        if line.startswith('NOR'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}01100')
            continue

        if line.startswith('INC'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(0,15)}01101')
            continue
        
        if line.startswith('DEC'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(0,15)}01110')
            continue
        
        if line.startswith('HAM'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(0,15)}01111')
            continue

        if line.startswith('MOVE'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[1],4)}{itob(0,15)}11100')
            continue
        
        if line.startswith('CMOV'):
            parts = re.split('[ ,R\[\]]{1,}',line)
            print(parts)
            machine_code.append(f'0000{itob(parts[2],4)}{itob(parts[3],4)}{itob(parts[1],4)}{itob(0,11)}11101')
            continue
            
        # J-TYPE INSTRUCTION

        if line.startswith('BR'):
            parts = re.split('[ ]{1,}',line)
            print(parts)
            machine_code.append(f'0110{itob(parts[1],28)}')
            continue
        
        if line.startswith('CALL'):
            parts = re.split('[ ]{1,}',line)
            print(parts)
            machine_code.append(f'0111{itob(parts[1],28)}')
            continue

        if line.startswith('RET'):
            parts = re.split('[ ]{1,}',line)
            print(parts)
            machine_code.append(f'1000{itob(parts[1],28)}')
            continue
        
        if line.startswith('HALT'):
            parts = re.split('[ ]{1,}',line)
            print(parts)
            machine_code.append(f'1001{itob(0,28)}')
            continue
        
        if line.startswith('NOP'):
            parts = re.split('[ ]{1,}',line)
            print(parts)
            machine_code.append(f'1010{itob(0,28)}')
            continue

    return machine_code

non_restoring_div_asm_code = """
LD R[1],0(R[0])              
LD R[2],1(R[0])             
LD R[3],2(R[0])             
MOVE R[4],R[1]               
MOVE R[5],R[2]              
BZ R[4],18                   
SUBI R[4],R[4],1            
SLT R[6],R[5],R[0]           
BZ  R[6],7                   
SLLI R[5],R[5],1             
SLL  R[7],R[3],R[1]          
ADD  R[5],R[5],R[7]          
SLT R[6],R[5],R[0]           
BZ  R[6],8                   
BR   5                       
SLLI R[5],R[5],1             
SLL  R[7],R[3],R[1]          
SUB  R[5],R[5],R[7]          
SLT R[6],R[5],R[0]           
BZ  R[6],2                   
BR   5                      
ADDI R[5],R[5],1             
BR 5                         
SLT R[6],R[5],R[0]           
BZ R[6],3                    
SLL  R[7],R[3],R[1]            
ADD R[5],R[5],R[7]           
HALT                         
"""

booth_asm_code = """
LD R[1],0(R[0])   
LD R[2],1(R[0])   
LD R[3],2(R[0])   
MOVE R[4],R[1]    
MOVE R[5],R[2]    
SLLI R[5],R[5],1  
BZ R[4],21        
SUBI R[4],R[4],1  
ANDI R[6],R[5],1
ANDI R[7],R[5],2
SRLI R[7],R[7],1
XOR R[8],R[6],R[7]
BZ R[8],13
SUBI R[7],R[7],1
BZ R[7],6
ADDI R[6],R[1],1
SLL  R[7],R[3],R[6]
ADD  R[5],R[5],R[7]
SRAI R[5],R[5],1
BR   6
ADDI R[6],R[1],1
SLL  R[7],R[3],R[6]
SUB  R[5],R[5],R[7]
SRAI R[5],R[5],1
BR   6
SRAI R[5],R[5],1
BR   6
HALT
"""
insertion_sort_asm_code = """
MOVE R[1],R[0]
SUBI R[2],R[1],10
BZ R[2],16
LD R[2],0(R[1])
MOVE R[3],R[0]
SUB R[4],R[3],R[1]
BZ R[4], 7
LD R[2],0(R[1])
LD R[4],0(R[3])
SUB R[5],R[2],R[4]
BMI R[5],5
ADDI R[3],R[3],1
BR 5
ADDI R[1],R[1],1
BR  1
ST R[2],0(R[3])
ST R[4],0(R[1])
BR 11
LD R[1],0(R[0])
LD R[2],1(R[0])
LD R[3],2(R[0])
LD R[4],3(R[0])
LD R[5],4(R[0])
LD R[6],5(R[0])
LD R[7],6(R[0])
LD R[8],7(R[0])
LD R[9],8(R[0])
LD R[10],9(R[0])
HALT
"""

insertion_sort_asm_code_FPGA = """
MOVE R[1],R[0]
SUBI R[2],R[1],10
BZ R[2],16
LD R[2],0(R[1])
MOVE R[3],R[0]
SUB R[4],R[3],R[1]
BZ R[4], 7
LD R[2],0(R[1])
LD R[4],0(R[3])
SUB R[5],R[2],R[4]
BMI R[5],5
ADDI R[3],R[3],1
BR 5
ADDI R[1],R[1],1
BR  1
ST R[2],0(R[3])
ST R[4],0(R[1])
BR 11
LD R[11],0(R[0])
LD R[11],1(R[0])
LD R[11],2(R[0])
LD R[11],3(R[0])
LD R[11],4(R[0])
LD R[11],5(R[0])
LD R[11],6(R[0])
LD R[11],7(R[0])
LD R[11],8(R[0])
LD R[11],9(R[0])
HALT
"""

test_asm_code = """
LD R[1],0(R[0])
LD R[2],1(R[0])
HAM R[3],R[1]
HAM R[4],R[2]
CMOV R[5],R[3],R[4]
HALT
"""

machine_code = assemble(insertion_sort_asm_code_FPGA)
i = 0
for code in machine_code:
    print(f'{code},')
    i = i+1