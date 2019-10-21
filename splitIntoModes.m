function [surface, shear, wall] = splitIntoModes(type)
    surface = sum(type == 1,3);
    shear = sum(type == 2,3);
    wall = sum(type == 3,3);
end