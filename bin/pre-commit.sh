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
    echo -n "👉 Type 'yes' to proceed with commit using --no-verify, anything else to cancel: "
    read USER_CONFIRM < /dev/tty

    if [[ "$USER_CONFIRM" == "yes" ]]; then
      echo ""
      echo "✅ Okay! Since you're committing a *deliberately failing* test:"
      echo ""
      echo "🔹 Step 1:"
      echo "   Copy the following command (highlight it and press ⌘ + C):"
      echo ""
      echo '   git commit -m "test(wip): add failing test for [what it’s testing]" --no-verify'
      echo ""
      echo "🔹 Step 2:"
      echo "   Paste it into your terminal (⌘ + V) and press return."
      echo ""
      echo "💬 You can adjust the commit message to explain *what* the test is checking."
      echo ""
      echo "💡 Why this works:"
      echo "   • The '--no-verify' flag skips the pre-commit check *just this once*."
      echo "   • The 'test(wip):' prefix shows this is an intentional work-in-progress."
      echo ""
      echo "🎯 You're practicing test-first thinking. Keep going!"
      echo ""
      exit 0
    else
      echo "🛑 Commit cancelled."
      exit 1
    fi
  fi

elif [[ "$TEST_TYPE" == "acceptance" ]]; then
  echo "🧪 Running acceptance tests..."
  run_with_timer "Acceptance tests" bash -c "PYTHONPATH=src poetry run behave tests/acceptance/features"
  [[ $? -ne 0 ]] && echo "❌ Acceptance tests failed! Aborting commit." && exit 1

elif [[ "$TEST_TYPE" == "all" ]]; then
  echo "📦 Running all tests (unit + acceptance)..."

  run_with_timer "Unit tests" bash -c "PYTHONPATH=src poetry run pytest tests/unit"
  UNIT_STATUS=$?

  run_with_timer "Acceptance tests" bash -c "PYTHONPATH=src poetry run behave tests/acceptance/features"
  ACCEPTANCE_STATUS=$?

  if [[ ${UNIT_STATUS:-1} -ne 0 || ${ACCEPTANCE_STATUS:-1} -ne 0 ]]; then
    echo "❌ One or more test types failed! Aborting commit."
    exit 1
  fi

else
  echo "⚠️  Usage: ./bin/pre-commit.sh [unit|acceptance|all]"
  exit 1
fi

echo "✅ All selected tests passed! Proceeding with commit."
exit 0
