a_Par = 2.856;
b_Par = 2.856;
c_Par = 2.856;

alpha_Par = 90;
beta_Par = 90;
gamma_Par = 90;

vector_Miller = [4,0,0];

cell_structure = 'bcc'; %crystalline structure

d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
q = 4 * pi/ (2*d); % q vector

a_atom_fact = [11.7695,7.3573,3.5222,2.3045];
b_atom_fact = [4.7611,0.3072,15.3535,76.8805];
c = 1.0369;

f_0 = 0;
for i_atom_fact = 1:4
    f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
end
f_0 = f_0 + c;
