CREATE OR REPLACE VIEW arhasi.rapid.aa_dashboard_test_view
AS SELECT
    app.id AS appID,
    test_case.id as testcaseID,
    responses.id as responseID,
    metrics.id as metricsID,
    app.model AS model,
    app.name as app_name,
    test_case.name as test_case,
    app.variation AS variation,
    test_case.prompt AS prompt,
    responses.output AS response,
    app.evaluation_model as evaluation_model,
    app.evaluation_variation as evaluation_variation,
    app.service as service,
    test_case.ground_input as ground_input,
    app.guardrails_config as guardrails_config,
    app.response_templates as response_templates,
    app.prompt_templates as prompt_templates,
    responses.type as response_type,
    app.RAG_source_bucket_name as rag_source,
    app.conversation as conversation,
    metrics.inserted_at as metrics_timestamp,
    responses.inserted_at as response_timestamp,
    test_case.inserted_at as test_case_timestamp,
    app.inserted_at as app_timestamp
FROM rapid.app 
    FULL OUTER JOIN rapid.test_case as test_case ON app.id = test_case.appID
    FULL OUTER JOIN rapid.responses as responses ON test_case.id = responses.testcaseID
    FULL OUTER JOIN rapid.metrics as metrics ON responses.id = metrics.responseID
WHERE service = 'testsuite';
