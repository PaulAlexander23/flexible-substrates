function tests = testEnergyDecomposition2()
    tests = functiontests(localfunctions);
end

function testFluidTerm1ConstantPerturbation(testCase)
    k = 2;
    z = linspace(0,1)';
    phi = z.^2;
    actual = computeFluidTerm1(k, z, phi);
    expected = -pi*(8+64/3+32/5);
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
end

function testFluidTerm2ConstantPerturbation(testCase)
    z = linspace(0,1)';
    phi = 2*z + 2i;
    params = struct('R',1);
    actual = computeFluidTerm2(z, phi, params);
    expected = -16*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
end

function testWorkPerUnitTimeResolutionConvergence(testCase)
    
    
    
    N = 20:60;
    for Nindex = 1:length(N)
        
        z = linspace(0,1,N(Nindex))';
        
        
    end
    
end