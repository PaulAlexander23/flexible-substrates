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
    params = struct('R',1,'AI',1,'AT',1,'AB',1,'AK',1,'S',1);
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
    params = struct('R',1,'AI',1,'AT',1,'AB',1,'AK',1,'S',1);
    actual = computeEnergy(k, c, z, phi, eta, h, params);
    expected = 37*pi;
    verifyEqual(testCase, actual, expected)
end

function testSurfaceEffectsOfZeroPerturbation(testCase)
    k = 2;
    c = 0;
    z = linspace(0,1)';
    phi = zeros(100,1);
    h = 0;
    actual = computeSurfaceEffects(k, c, z, phi, h);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testSurfaceEffectsOfConstantPerturbation(testCase)
    k = 2;
    c = -1i;
    z = linspace(0,1)';
    phi = (z.^2/2 + z) * (1 + 1i);
    h = 1;
    actual = computeSurfaceEffects(k, c, z, phi, h);
    expected = 8*pi + 32*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
end

function testWallEffectsOfZeroPerturbation(testCase)
    k = 2;
    c = 0;
    z = linspace(0,1)';
    phi = zeros(100,1);
    eta = 0;
    params = struct('AD',1);
    actual = computeWallEffects(k, c, z, phi, eta, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testWallEffectsOfConstantPerturbation(testCase)
    k = 2;
    c = 1-1i;
    z = linspace(0,1)';
    phi = z * (1 + 1i);
    eta = 2;
    params = struct('AD',1);
    actual = computeWallEffects(k, c, z, phi, eta, params);
    expected = -64*pi + 128*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
end

function testFluidEffectsOfZeroPerturbation(testCase)
    k = 2;
    z = linspace(0,1)';
    phi = zeros(100,1);
    params = struct('R',1);
    actual = computeFluidEffects(k, z, phi, params);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testFluidEffectsOfConstantPerturbation(testCase)
    k = 2;
    z = linspace(0,1)';
    phi = (z.^2 + 2*z + 2i);
    params = struct('R',1);
    actual = computeFluidEffects(k, z, phi, params);
    expected = -2088/5*pi - 64/3*pi;
    verifyEqual(testCase, actual, expected, 'RelTol', 0.01)
end
