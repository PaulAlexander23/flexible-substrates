function tests = testClassification()
    tests = functiontests(localfunctions);
end

function testSurfaceModeAnsatz(testCase)
    classificationVariables
    params = surfaceModeAnsatzParams;
    actual = classifyMode(params, 1);
    expected = surfaceMode;
    verifyEqual(testCase, actual, expected)
end

function testShearModeAnsatz(testCase)
    classificationVariables
    params = shearModeAnsatzParams;
    actual = classifyMode(params, 1);
    expected = shearMode;
    verifyEqual(testCase, actual, expected)
end

function testWallModeAnsatz(testCase)
    classificationVariables
    params = wallModeAnsatzParams;
    actual = classifyMode(params, 2);
    expected = wallMode;
    verifyEqual(testCase, actual, expected)
end

function testSurfaceShearHybrid(testCase)
    classificationVariables
    params = surfaceShearHybridModeParams;
    
    actual = classifyMode(params, 2, true);
    expected = surfaceMode;
    verifyEqual(testCase, actual, expected)
    
    actual = classifyMode(params, 1, true);
    expected = shearMode;
    verifyEqual(testCase, actual, expected)
end

function testClassificationVectorisation(testCase)
    classificationVariables;
    params = {surfaceModeAnsatzParams, surfaceModeAnsatzParams};
    actual = classifyMode(params, 1);
    expected = [surfaceMode, surfaceMode];
    verifyEqual(testCase, actual, expected)
end