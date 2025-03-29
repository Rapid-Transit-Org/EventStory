# WIP: This test is expected to fail. It represents the intended behaviour
# once the conflict alert logic between teams is implemented.

def test_conflict_alert_is_triggered_for_same_activity_different_teams():
    # Arrange
    activity_id = "activity-123"
    team_1_decision = "approve"
    team_2_decision = "reject"

    # Act
    # (no real logic yet — this is just a placeholder for what will become your domain call)
    conflict_detected = False  # TODO: replace with real conflict detection logic

    # Assert
    assert conflict_detected, "Expected conflict to be detected when different teams disagree"
