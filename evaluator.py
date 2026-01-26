def analyze_signature(asm_content):
    # 1. 识别字符串返回特征：adrp 指向 l_.str
    if "l_.str" in asm_content and "ret" in asm_content:
        return "TYPE_STR_RETURN"
    
    # 2. 识别多参数特征：同时使用 x0, x1, x2, x3
    if all(reg in asm_content for reg in ["x0", "w1", "x2", "w3"]):
        # 如果不是返回字符串，则可能是之前的多参数模式
        return "TYPE_MULTIPARAM"

    # 3. 识别 malloc
    if "bl _malloc" in asm_content:
        return "TYPE_MALLOC"
    
    # 4. 识别浮点
    if any(f in asm_content.lower() for f in ["fadd", "s0", "d0"]):
        return "TYPE_FLOAT"
    
    return "TYPE_GENERAL"