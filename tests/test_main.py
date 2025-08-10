import pytest
from app.main import app

@pytest.fixture
def client():
    app.testing = True
    return app.test_client()

def test_index(client):
    resp = client.get("/")
    assert resp.status_code == 200
    assert b"I'm from Python" in resp.data
