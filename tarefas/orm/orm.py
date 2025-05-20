from sqlalchemy import create_engine, Column, Integer, String, Date, ForeignKey, Numeric
from sqlalchemy.orm import declarative_base, relationship, sessionmaker

Base = declarative_base()

class Funcionario(Base):
    __tablename__ = 'funcionario'

    codigo = Column(Integer, primary_key=True)
    nome = Column(String(150))
    sexo = Column(String(1))
    dt_nasc = Column(Date)
    salario = Column(Numeric)  # 'money' não existe diretamente no SQLAlchemy
    supervisor = Column(Integer, ForeignKey('funcionario.codigo', ondelete='SET NULL', onupdate='CASCADE'))
    depto = Column(Integer, ForeignKey('departamento.codigo', ondelete='SET NULL', onupdate='CASCADE'))

    supervisor_rel = relationship("Funcionario", remote_side=[codigo])
    departamento_rel = relationship("Departamento", foreign_keys=[depto], back_populates="funcionarios")

    projetos_responsavel = relationship("Projeto", back_populates="responsavel_rel", foreign_keys='Projeto.responsavel')


class Departamento(Base):
    __tablename__ = 'departamento'

    codigo = Column(Integer, primary_key=True)
    nome = Column(String(100))
    sigla = Column(String(10), unique=True)
    descricao = Column(String(250))
    gerente = Column(Integer, ForeignKey('funcionario.codigo', ondelete='SET NULL', onupdate='CASCADE'))

    gerente_rel = relationship("Funcionario", foreign_keys=[gerente])
    funcionarios = relationship("Funcionario", foreign_keys='Funcionario.depto', back_populates="departamento_rel")
    projetos = relationship("Projeto", back_populates="departamento_rel")


class Projeto(Base):
    __tablename__ = 'projeto'

    codigo = Column(Integer, primary_key=True)
    nome = Column(String(50), unique=True)
    descricao = Column(String(250))
    responsavel = Column(Integer, ForeignKey('funcionario.codigo', ondelete='SET NULL', onupdate='CASCADE'))
    depto = Column(Integer, ForeignKey('departamento.codigo', ondelete='SET NULL', onupdate='CASCADE'))
    data_inicio = Column(Date)
    data_fim = Column(Date)

    responsavel_rel = relationship("Funcionario", foreign_keys=[responsavel])
    departamento_rel = relationship("Departamento", foreign_keys=[depto], back_populates="projetos")
    atividades = relationship("Atividade", back_populates="projeto_rel")


class Atividade(Base):
    __tablename__ = 'atividade'

    codigo = Column(Integer, primary_key=True)
    descricao = Column(String(250))
    projeto = Column(Integer, ForeignKey('projeto.codigo', ondelete='SET NULL', onupdate='CASCADE'))
    data_inicio = Column(Date)
    data_fim = Column(Date)

    projeto_rel = relationship("Projeto", foreign_keys=[projeto], back_populates="atividades")

# Configura conexão
engine = create_engine('postgresql+psycopg2://usuario_tarefa:senha123@localhost:5432/atividade_db')


Session = sessionmaker(bind=engine)
session = Session()

# Inserir uma atividade em algum projeto
nova_atividade = Atividade(
    descricao="Atividade de teste via ORM sem main",
    projeto=1,  # projeto com código 1
    data_inicio='2025-05-20',
    data_fim='2025-05-25'
)
session.add(nova_atividade)

# Atualizar o líder de algum projeto
projeto_alvo = session.query(Projeto).filter_by(codigo=1).first()
if projeto_alvo:
    projeto_alvo.responsavel = 2  # funcionário com código 2

# Listar todos os projetos e suas atividades
projetos = session.query(Projeto).all()
for projeto in projetos:
    print(f"Projeto: {projeto.nome}")
    for atividade in projeto.atividades:
        print(f"  Atividade: {atividade.descricao}")

# Salvar no banco
session.commit()
session.close()
