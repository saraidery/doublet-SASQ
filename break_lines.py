
filenames = ['mu_2_H_nu_1']
for filename in filenames:
    file_in = open(f"{filename}.F90", 'r')

    lines = file_in.readlines()


    with open(f"{filename}_lb.F90", 'w') as file_out:
        for line in lines:
            if len(line) > 110:
                offset = 0
                while offset < len(line):
                    end = min(offset + 110, len(line))

                    if end == len(line):
                        file_out.write(line[offset:])
                        break


                    end = offset + line[offset:end].rfind(',') + 1

                    bl = line[offset : end]
                    bl = bl + " &\n"

                    file_out.write(bl)
                    offset = end + 1

            else:
                file_out.write(line)

    file_in.close()