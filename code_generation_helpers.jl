
function generate_eT_code(file_name, routine_name, eq, eq_name, symmetry, translation, wf)
    open(file_name*".jl", "w") do io
        println(io, "include("*"\"../TensorOperation-eT-code/src/omeinsum_impl.jl\""*")")
        println(io, "open(\""*file_name*".F90\", \"w\") do io")
        println(io, "s = "*print_eT_function_generator(routine_name, eq, eq_name, symmetry, translation, wf,
            Dict([
                "u_vovo" => "u_aibj",
                "U1_vovo" => "wf%u1",
                "U2_vovo" => "wf%u2",
                "V1_vovo" => "wf%v1",
                "V2_vovo" => "wf%v2",
                "W1_vovo" => "wf%w1",
                "W2_vovo" => "wf%w2",
                "s_vovo" => "wf%s",
                "t_vovo" => "t_aibj",
                "F_oo" => "wf%fock_ij",
                "F_vv" => "wf%fock_ab",
                "F_ov" => "wf%fock_ia",
                "F_vo" => "wf%fock_ai",
            ]), ["F_oo", "F_vv", "F_ov", "F_vo", "U1_vovo", "U2_vovo",
                "V1_vovo", "V2_vovo", "W1_vovo", "W2_vovo", "s_vovo"]))
        println(io, "println(io, s)")
        println(io, "end")
    end
end
