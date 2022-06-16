//El tipo de version de solidity que vamos a usar
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract Estudiante{
string private _nombre;
string private _apellido;
string private _curso;
mapping(string => uint) private _notas_materias;
mapping(uint8 => string) private _materias;
uint8 private _cantidad_materias = 0;
address private _docente;
constructor (string memory nombre_, string memory apellido_, string memory curso_){
    _nombre = nombre_;
    _apellido = apellido_;
    _curso = curso_;
    _docente = msg.sender;
}
 
 
function apellido() public view returns (string memory)
   
{
        return _apellido;
}
function nombre_completo() public view returns (string memory)
{
   
    string memory cn = string(abi.encodePacked(_nombre, "" "",_apellido));
    return cn;
}
function curso() public view returns (string memory)
   
{
        return _curso;
}
 
function set_nota_materia(string memory materia, uint nota) public{
    require (msg.sender == _docente, "Solo el docente puede asignar las notas en las materias");
   
    _notas_materias[materia] = nota;
   
 
 
    }
 
    function nota_materia(string memory materia) public view returns (uint){
        return _notas_materias[materia];
    }
 
    function aprobo (string memory materia) public view returns (bool)
    {
        bool _aprobo = false;
        if (_notas_materias[materia] >=60)
        {
            _aprobo = true;
        }
        return _aprobo;
    }
    function promedio () public view returns (uint8)
    {
       
        uint8 _promedio = 0;
        for(uint8 i =0;i<_cantidad_materias;i++){
            _promedio += _notas_materias[_materias[i]];
        }
        _promedio /= _cantidad_materias;
        return _promedio;
    }
 
 
 
 
}
