function tests = testEnergyDecomposition()
    tests = functiontests(localfunctions);
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
    z = linspace(0,1)';
    phi = zeros(100,1);
    actual = computeSurfaceShear(k, z, phi);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testSurfaceShearOfConstantPerturbation(testCase)
    k = 2;
    z = linspace(0,1)';
    phi = (z.^2/2 + z) * (1 + 1i);
    actual = computeSurfaceShear(k, z, phi);
    expected = 56*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
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
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
end

function testWallShearOfZeroPerturbation(testCase)
    k = 2;
    z = linspace(0,1)';
    phi = zeros(100,1);
    actual = computeWallShear(k, z, phi);
    expected = 0;
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
end

function testWallShearOfConstantPerturbation(testCase)
    k = 2;
    z = linspace(0,1)';
    phi = (z.^2/2 + z) * (1 + 1i);
    actual = computeWallShear(k, z, phi);
    expected = -4*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
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
    verifyEqual(testCase, actual, expected, 'RelTol', 1e-13)
end

function testViscousDissipationOfZeroPerturbation(testCase)
    k = 2;
    z = linspace(0,1)';
    phi = zeros(100,1);
    actual = computeViscousDissipation(k, z, phi);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testViscousDissipationOfConstantPerturbation(testCase)
    k = 1;
    z = linspace(0,1)';
    phi = z.^2/2;
    actual = computeViscousDissipation(k, z, phi);
    expected = -103/15*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
end

function params = defaultParams()
    params = makeParamsStruct(1,1,1,1,1,1,1,1,1);
end