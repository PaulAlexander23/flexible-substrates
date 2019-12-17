function tests = testEnergyDecomposition()
    tests = functiontests(localfunctions);
end

function testNoSlipBoundaryCondition(testCase)
    params = makeParamsStruct(1,1,1,1,1,1,1,1,1);
    numberOfPolynomials = 50;
    [val,vec] = chebyshevTauFlexibleOS(params,numberOfPolynomials);
    val = val(1);
    vec = vec(1:end/2,1);
    
    actual = computedPhidz(0, vec);
    expected = -2 * computeEta(val, vec);
    verifyEqual(testCase, actual, expected, 'RelTol', 1e-11);
end

function testEnergyOfZeroPerturbation(testCase)
    val = 0;
    vec = [0, 0, 0].';
    params = struct('cotbeta',1,'k',2,'R',1,'AI',1,'AT',1,'AB',1,'AK',1,'S',1);
    actual = computeEnergy(val, vec, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testEnergyOfConstantPerturbation(testCase)
    val = 1 + 1i;
    vec = [1, 0, 0].';
    params = struct('cotbeta',1,'k',2,'R',1,'AI',1,'AT',1,'AB',1,'AK',1,'S',1);
    actual = computeEnergy(val, vec, params);
    expected = 4*pi + 13.5*pi + pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testEnergyOfConstantComplexPerturbation(testCase)
    val = 1 + 1i;
    vec = [1 + 1i, 0, 0].';
    params = struct('cotbeta',1,'k',2,'R',1,'AI',1,'AT',1,'AB',1,'AK',1,'S',1);
    actual = computeEnergy(val, vec, params);
    expected = 8*pi + 27*pi + 2*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testEnergyOfConstantComplexPerturbation2(testCase)
    val = 1 - 1i;
    vec = [1 + 1i, 0, 0].';
    params = struct('cotbeta',1,'k',2,'R',1,'AI',1,'AT',1,'AB',1,'AK',1,'S',1);
    actual = computeEnergy(val, vec, params);
    expected = 8*pi + 27*pi + 2*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testSurfaceShearOfZeroPerturbation(testCase)
    params = struct('k', 2);
    vec = zeros(100,1);
    actual = computeSurfaceShear(vec, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testSurfaceShearOfConstantPerturbation(testCase)
    params = struct('k', 2);
    vec = zeros(100,1);
    vec(1:3) = [11, 12, 1] * (1 + 1i)/16;
    actual = computeSurfaceShear(vec, params);
    expected = -40*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testWallDampingOfZeroPerturbation(testCase)
    val = 0;
    vec = [0, 0, 0]';
    params = struct('k', 2, 'AD', 1);
    actual = computeWallDamping(val, vec, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testWallDampingOfConstantPerturbation(testCase)
    val = 1 - 1i;
    vec = [2+2i,0,0].';
    params = struct('k', 2, 'AD', 1);
    actual = computeWallDamping(val, vec, params);
    expected = -64 * pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 2*eps)
end

function testWallShearOfZeroPerturbation(testCase)
    params = struct('k', 2);
    vec = zeros(100,1);
    actual = computeWallShear(vec, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testWallShearOfConstantPerturbation(testCase)
    params = struct('k', 2);
    vec = zeros(100,1);
    vec(1:3) = [11, 12, 1] * (1 + 1i)/16;
    actual = computeWallShear(vec, params);
    expected = -4*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testReynoldsStressOfZeroPerturbation(testCase)
    vec = zeros(50,1);
    params = struct('R',1);
    actual = computeReynoldsStress(vec, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testReynoldsStressOfConstantPerturbation(testCase)
    vec = [1/2+2i,2,1/2].';
    params = struct('R',1);
    actual = computeReynoldsStress(vec, params);
    expected = -64/3*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testReynoldsStressOfConstantPerturbation2(testCase)
    vec = [3i/4, -1 + 1i, 1i/4].';
    params = struct('R',1);
    actual = computeReynoldsStress(vec, params);
    expected = 8 * pi / 3;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testViscousDissipationOfZeroPerturbation(testCase)
    params = struct('k', 2);
    vec = zeros(5,1);
    actual = computeViscousDissipation(vec, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testViscousDissipationOfConstantPerturbation1(testCase)
    params = struct('k', 2);
    vec = zeros(5,1);
    vec(1) = 1;
    actual = computeViscousDissipation(vec, params);
    expected = - 32 * pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testViscousDissipationOfConstantPerturbationLinear(testCase)
    params = struct('k', 1);
    vec = zeros(5,1);
    vec(1) = 1;
    vec(2) = 1;
    actual = computeViscousDissipation(vec, params);
    expected = - 112/3 * pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testViscousDissipationOfConstantPerturbation(testCase)
    params = struct('k', 1);
    vec = zeros(5,1);
    vec(1:3) = [3, 4, 1]/16;
    actual = computeViscousDissipation(vec, params);
    expected = -103/15*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function params = defaultParams()
    params = makeParamsStruct(1,1,1,1,1,1,1,1,1);
end
