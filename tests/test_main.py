import pytest
from app.main import app

@pytest.fixture
def client():
    app.testing = True
    return app.test_client()

def test_index(client):
    resp = client.get("/")
    assert resp.status_code == 200
    html = resp.data.decode('utf-8')
    assert "I'm from Python" in html  # Decoding handles the HTML entities
