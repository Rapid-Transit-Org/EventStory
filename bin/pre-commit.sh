#!/bin/bash
echo "🚀 Running pre-commit hook..."
cd "$(dirname "$0")/.." || exit 1

echo "🧭 Running from: $(pwd)"

TEST_TYPE=$1

# Function to time any block of commands
run_with_timer() {
  local label=$1
  shift
  local start=$(date +%s)
  "$@"
  local status=$?
  local end=$(date +%s)
  local runtime=$((end - start))
  echo "⏱️  $label finished in $runtime seconds with status $status"
  return $status
}

if [[ "$TEST_TYPE" == "unit" ]]; then
  echo "🔬 Running unit tests..."
  bash -c "PYTHONPATH=src poetry run pytest tests/unit"
  UNIT_STATUS=$?

  if [[ $UNIT_STATUS -ne 0 ]]; then
    echo ""
    echo "❌ Unit tests failed."
    echo "📝 Is this a *deliberate* failing test you're committing as part of test-first development?"
    read -p "👉 Type 'yes' to proceed with commit using --no-verify, anything else to cancel: " USER_CONFIRM

    if [[ "$USER_CONFIRM" == "yes" ]]; then
      echo ""
      echo "🔓 You can now commit manually using:"
      echo "    git commit -m \"test
