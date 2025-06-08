import re

def transform_text(text):
    # Remove the exact string
    text = text.replace("C(p∈o, q∈v, r∈o, s∈v, t∈o, u∈v)", "")

    # Protect 'sin', 'u_' and 't_'
    text = text.replace('sin', '__SIN__')
    text = text.replace('cos', '__COS__')
    text = re.sub(r'u(?=_)', '__U__', text)
    text = re.sub(r't(?=_)', '__T__', text)

    # Apply replacements
    text = text.replace('s', 'b')
    text = text.replace('r', 'j')
    text = text.replace('u', 'c')
    text = text.replace('t', 'k')
    text = text.replace('p', 'I')
    text = text.replace('q', 'A')
    text = text.replace('+ -', '- ')
    text = text.replace('*', ' ')

    # Restore protected patterns
    text = text.replace('__SIN__', 'sin')
    text = text.replace('__COS__', 'cos')
    text = text.replace('__U__', 'u')
    text = text.replace('__T__', 't')

    # # Swap 'E.α_' and 'E.β_' patterns
    # pattern = r'(E.α_)([a-zA-Z]{1,3})\s+(E.β_)([a-zA-Z]{1,3})'
    # text = re.sub(pattern, r'\3\2 \1\4', text)

    return text

# File paths
for i in [2open]:
    input_file = f't_eta_{i}.txt'
    output_file = f't_eta_{i}_pure.txt'

    # Read, transform, and write back
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()

    transformed = transform_text(content)

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("+ ")
        f.write(transformed)