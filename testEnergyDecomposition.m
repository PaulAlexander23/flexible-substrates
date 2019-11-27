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
    k = 2;
    c = 0;
    z = linspace(0,1)';
    phi = zeros(100,1);
    eta = 0;
    h = 0;
    params = struct('cotbeta',1,'R',1,'AI',1,'AT',1,'AB',1,'AK',1,'S',1);
    actual = computeEnergy(k, c, z, phi, eta, h, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testEnergyOfConstantPerturbation(testCase)
    k = 2;
    c = 1 + 1i;
    z = linspace(0,1)';
    phi = ones(100,1);
    eta = 1;
    h = 1;
    params = struct('cotbeta',1,'R',1,'AI',1,'AT',1,'AB',1,'AK',1,'S',1);
    actual = computeEnergy(k, c, z, phi, eta, h, params);
    expected = 33*pi;
    verifyEqual(testCase, actual, expected)
end

function testSurfaceShearOfZeroPerturbation(testCase)
    k = 2;
    vec = zeros(100,1);
    actual = computeSurfaceShear(k, vec);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testSurfaceShearOfConstantPerturbation(testCase)
    k = 2;
    vec = zeros(100,1);
    vec(1:3) = [11, 12, 1] * (1 + 1i)/16;
    actual = computeSurfaceShear(k, vec);
    expected = 56*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testWallDampingOfZeroPerturbation(testCase)
    k = 2;
    c = 0;
    eta = 0;
    params = struct('AD',1);
    actual = computeWallDamping(k, c, eta, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testWallDampingOfConstantPerturbation(testCase)
    k = 2;
    c = 1-1i;
    eta = 2;
    params = struct('AD',1);
    actual = computeWallDamping(k, c, eta, params);
    expected = -64 * pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 2*eps)
end

function testWallShearOfZeroPerturbation(testCase)
    k = 2;
    vec = zeros(100,1);
    actual = computeWallShear(k, vec);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testWallShearOfConstantPerturbation(testCase)
    k = 2;
    vec = zeros(100,1);
    vec(1:3) = [11, 12, 1] * (1 + 1i)/16;
    actual = computeWallShear(k, vec);
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
    k = 2;
    z = linspace(0,1)';
    phi = zeros(100,1);
    vec = zeros(5,1);
    actual = computeViscousDissipation(k, z, phi, vec);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testViscousDissipationOfConstantPerturbation1(testCase)
    k = 2;
    z = linspace(0,1)';
    phi = 1;
    vec = zeros(5,1);
    vec(1) = 1;
    actual = computeViscousDissipation(k, z, phi, vec);
    expected = - 32 * pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testViscousDissipationOfConstantPerturbationLinear(testCase)
    k = 1;
    z = linspace(0,1)';
    phi = 2 * z;
    vec = zeros(5,1);
    vec(1) = 1;
    vec(2) = 1;
    actual = computeViscousDissipation(k, z, phi, vec);
    expected = - 112/3 * pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function testViscousDissipationOfConstantPerturbation(testCase)
    k = 1;
    z = linspace(0,1)';
    phi = z.^2/2;
    vec = zeros(5,1);
    vec(1:3) = [3, 4, 1]/16;
    actual = computeViscousDissipation(k, z, phi, vec);
    expected = -103/15*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', eps)
end

function params = defaultParams()
    params = makeParamsStruct(1,1,1,1,1,1,1,1,1);
end